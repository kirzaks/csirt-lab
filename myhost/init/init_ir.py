from time import sleep
from datetime import datetime
from xmlrpc.server import resolve_dotted_attribute

import requests

from incidents import incidents
from random import choice
from mailsend import SendMail
import psycopg

admins = []
automated = []
users = []
goodspam = []
badspam = []



class RTIR:
    def __init__(self, user_id, ir_id):
        handlers = {
            0: "1-44-8cf8bf2a7c10b4c577d28859d0285097",
            1: "1-46-f9f57ed53704d1fc40c10d3fd5cbc90a",
            2: "1-48-cb13ad93c0355f1867b545cd511c71f4",
            3: "1-14-4df61206d6162e9bd8039eb55eb4e2e9"
        }
        self.user_token = handlers[user_id]
        self.ticket_id = ir_id
        self.incident_id = None

    def send_req(self, method, url, data=None):
        base_url = "http://localhost/REST/2.0/"
        headers = {"Content-Type": "application/json",
                   "Authorization": f"token {self.user_token}"}

        rez = requests.request(method, base_url + url, headers=headers, json=data)
        print(rez.text)
        return rez.json()

    def open_ticket(self):
        self.send_req(method="GET", url=f"ticket/{self.ticket_id}")

    def take_ticket(self, ticket_id=None):
        if ticket_id is None:
            ticket_id = self.ticket_id

        self.send_req(method="PUT", url=f"ticket/{ticket_id}/take")

    def update_ticket(self, post_data):
        self.send_req(method="PUT", url=f"ticket/{self.ticket_id}", data=post_data)
        if self.incident_id:
            self.send_req(method="PUT", url=f"ticket/{self.incident_id}", data=post_data)


    def create_incident(self, post_data):
        rez = self.send_req(method="POST", url="ticket", data=post_data)
        self.incident_id = rez.get("id")
        self.take_ticket(rez.get("id"))
        self.update_ticket({"AddParent": rez.get("id")})

    def replay(self, post_data):
        self.send_req(method="POST", url=f"ticket/{self.ticket_id}/correspond", data=post_data)

    def comment(self, post_data):
        self.send_req(method="POST", url=f"ticket/{self.ticket_id}/comment", data=post_data)



def gen_emails(mailusers, tld):
    datalist = []
    for user in mailusers:
        datalist.append(f"{user}@{tld}.local")
    return datalist

def convert_timeobj(time_convert):
    return datetime.strptime(time_convert, "%Y-%m-%d %H:%M:%S")


# Fill tickets

for i in ["gmail", "mail", "yahoo", "icloud", "outlook", "proton"]:
    admins.extend(gen_emails(["admin", "root"], i))
    automated.extend(gen_emails(["bot", "security"], i))
    users.extend(gen_emails(["ammy", "tori", "john", "casady"], i))
    goodspam.extend(gen_emails(["ben", "martha"], i))
    badspam.extend(gen_emails(["spam"], i))


for i in incidents:
    sleep(2)
    if i.get("source") == "user":
        SendMail(mailfrom=choice(users), subject=i.get("subject"),body=i.get("body"), datetimenow=convert_timeobj(i.get("time")))
    elif i.get("source") == "admin":
        SendMail(mailfrom=choice(admins), subject=i.get("subject"), body=i.get("body"), datetimenow=convert_timeobj(i.get("time")))
    elif i.get("source") == "automated":
        SendMail(mailfrom=choice(automated), subject=i.get("subject"), body=i.get("body"), datetimenow=convert_timeobj(i.get("time")))
    elif i.get("source") == "goodspam":
        SendMail(mailfrom=choice(goodspam), subject=i.get("subject"), body=i.get("body"), datetimenow=convert_timeobj(i.get("time")))
    elif i.get("source") == "badspam":
        if i.get("mailfrom"):
            SendMail(mailfrom="", subject=i.get("subject"), body=i.get("body"), fakemail=True, datetimenow=convert_timeobj(i.get("time")))
        else:
            SendMail(mailfrom=choice(badspam), subject=i.get("subject"), body=i.get("body"), datetimenow=convert_timeobj(i.get("time")))
    else:
        print("Error", i)

print("Cooldown for 30 sec")
sleep(30)

conn = psycopg.connect("dbname=rt6 user=root password=toor host=postgres port=5432")
cur = conn.cursor()

# User Actions
for i in incidents:
    actions = i.get("actions")
    if not actions:
        continue
    ticket_id = cur.execute("SELECT id from tickets where subject = %s ORDER BY id LIMIT 1", (i["subject"],)).fetchone()[0]
    rtir = RTIR(user_id=actions.get("user"), ir_id=ticket_id)


    if "user" in actions.keys():
        user_id = actions.get("user")
        if user_id != 3:
            rtir.take_ticket()
        rtir.update_ticket({"Status":"open"})

    if "incident" in actions.keys():
        data_send = {
            "Queue": "Incidents",
            "Subject": i["subject"],
            "Content": i["body"]
        }
        rtir.create_incident(data_send)

    if "replay" in actions.keys():
        data_send = {
            "Content": actions["replay"],
            "ContentType": "text/plain"
        }
        rtir.replay(data_send)

    if "comment" in actions.keys():
        data_send = {
            "Content": actions["comment"],
            "ContentType": "text/plain"
        }
        rtir.comment(data_send)

    if "general" in actions.keys():
        rtir.update_ticket({"Queue": "General"})

    if "rejected" in actions.keys():
        rtir.update_ticket({"Status": "rejected"})

    if "resolved" in actions.keys():
        rtir.update_ticket({"Status": "resolved"})

    if "priority" in actions.keys():
        rtir.update_ticket({"Priority": actions["priority"]})


def fix_time(new_time, t_id):
    cur.execute("UPDATE tickets SET lastupdated = %s, created = %s WHERE id = %s", (new_time, new_time, t_id,))
    cur.execute("UPDATE transactions SET created = %s WHERE objecttype = 'RT::Ticket' AND objectid = %s", (new_time, t_id,))

    tr_ids = cur.execute("SELECT id FROM transactions WHERE objecttype = 'RT::Ticket' AND objectid = %s",(t_id,)).fetchall()
    for tr_id in tr_ids:
        if attach_id:= cur.execute("SELECT transactionid FROM attachments WHERE transactionid = %s", (tr_id[0],)).fetchone():
            cur.execute("UPDATE attachments SET created = %s WHERE transactionid = %s", (new_time, attach_id[0],))



# Fix datetime. Test with users
for i in incidents:
    ticket_id = cur.execute("SELECT id from tickets where subject = %s ORDER BY id LIMIT 1", (i["subject"],)).fetchone()
    ticket_id = ticket_id[0]

    fix_time(i.get("time"), ticket_id)

    ticket_id = cur.execute("SELECT id from tickets where subject = %s and queue = 3 ORDER BY id LIMIT 1", (i["subject"],)).fetchone()
    if not ticket_id:
        continue
    ticket_id = ticket_id[0]

    fix_time(i.get("time"), ticket_id)


conn.commit()
conn.close()


