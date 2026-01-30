import smtplib
import datetime
import argparse
import os
from email.utils import format_datetime
from email.message import EmailMessage

class SendMail:
    def __init__(self, mailfrom, subject, body, fakemail=False, datetimenow=None):
        self.subject = subject
        self.body = body

        domain = os.environ["INITDOMAIN"]
        self.rcpto = f"rtir@{domain}"

        if fakemail:
            self.mailfrom = self.rcpto
        else:
            self.mailfrom = mailfrom

        if datetimenow:
            self.datetimenow = format_datetime(datetimenow)
        else:
            self.datetimenow = format_datetime(datetime.datetime.now(datetime.timezone.utc))



        self.send_mail()


    def send_mail(self):
        msg = EmailMessage()
        msg['Subject'] = self.subject
        msg['From'] = self.mailfrom
        msg['To'] = self.rcpto
        msg['Date'] = self.datetimenow
        msg.set_content(self.body)

        try:
            s = smtplib.SMTP('mailserver')
        except ConnectionRefusedError as err:
            print("SMTP Error", err)
            return None
        try:
            s.send_message(msg)
            print(f"Email sent: {self.mailfrom} -> {self.rcpto} [{self.subject}]")
        except smtplib.SMTPException as err:
            print("Error: unable to send email", err)
        s.quit()
        return None

if __name__ == "__main__":

    parser = argparse.ArgumentParser("Simple mail sender script to rtir mailbox")
    parser.add_argument("-f", "--mailfrom",
                        help="Mail from",
                        required=True)
    parser.add_argument("-s", "--subject",
                        help="Mail subject",
                        required=True)
    parser.add_argument("-b", "--body",
                        help="Mail body",
                        required=True)

    args = parser.parse_args()


    SendMail(args.mailfrom, args.subject, args.body)