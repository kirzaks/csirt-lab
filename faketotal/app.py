from flask import Flask, request, render_template, redirect, url_for
from typing import Literal
import random
import psycopg
from datetime import datetime
import json
import os
import re

app = Flask(__name__)

_IPV4 = (
    r"(?:(?:25[0-5]|2[0-4]\d|1\d{2}|[1-9]\d|\d)\.){3}"
    r"(?:25[0-5]|2[0-4]\d|1\d{2}|[1-9]\d|\d)"
)
_IPV6 = (
    r"(?:"
    r"(?:[0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}"
    r"|(?:[0-9a-fA-F]{1,4}:){1,7}:"
    r"|:(?::[0-9a-fA-F]{1,4}){1,7}"
    r"|(?:[0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}"
    r"|(?:[0-9a-fA-F]{1,4}:){1,5}(?::[0-9a-fA-F]{1,4}){1,2}"
    r"|(?:[0-9a-fA-F]{1,4}:){1,4}(?::[0-9a-fA-F]{1,4}){1,3}"
    r"|(?:[0-9a-fA-F]{1,4}:){1,3}(?::[0-9a-fA-F]{1,4}){1,4}"
    r"|(?:[0-9a-fA-F]{1,4}:){1,2}(?::[0-9a-fA-F]{1,4}){1,5}"
    r"|[0-9a-fA-F]{1,4}:(?::[0-9a-fA-F]{1,4}){1,6}"
    r"|::(?:ffff(?::0{1,4})?:)?" + _IPV4 + r"|::1"
    r")"
)
_URL = (
    r"(?:https?|ftp)://"
    r"(?:[A-Za-z0-9\-._~%!$&'()*+,;=:@]+@)?"
    r"(?:" + _IPV6 + r"|\[" + _IPV6 + r"\]|" + _IPV4 + r"|[A-Za-z0-9\-]+(?:\.[A-Za-z0-9\-]+)*)"
    r"(?::\d{1,5})?"
    r"(?:/[^\s]*)?"
)
_DOMAIN = (
    r"(?:[A-Za-z0-9](?:[A-Za-z0-9\-]{0,61}[A-Za-z0-9])?\.)+"
    r"[A-Za-z]{2,24}"
)
_HASH_MD5 = r"[0-9a-fA-F]{32}"
_HASH_SHA1 = r"[0-9a-fA-F]{40}"
_HASH_SHA256 = r"[0-9a-fA-F]{64}"
_HASH_SHA512 = r"[0-9a-fA-F]{128}"

RE_IPV4 = re.compile(r"^" + _IPV4 + r"$")
RE_IPV6 = re.compile(r"^" + _IPV6 + r"$")
RE_URL = re.compile(r"^" + _URL + r"$", re.IGNORECASE)
RE_DOMAIN = re.compile(r"^" + _DOMAIN + r"$", re.IGNORECASE)
RE_HASH = re.compile(r"^(?:" + _HASH_SHA512 + r"|" + _HASH_SHA256 + r"|" + _HASH_SHA1   + r"|" + _HASH_MD5 + r")$", re.IGNORECASE,)

IOCType = Literal["ip", "url", "hash", "domain", None]


def classify(value: str) -> IOCType:

    v = value.strip()

    if RE_URL.match(v):
        return "url"
    if RE_IPV4.match(v) or RE_IPV6.match(v):
        return "ip"
    if RE_HASH.match(v):
        return "hash"
    if RE_DOMAIN.match(v):
        return "domain"
    return None


def generate_stat() -> int:
    value = random.choices([0, 1, 2, 3], weights=[20, 10, 30, 40], k=1)[0]
    if value == 0:
        return 0
    elif value == 1:
        return random.randint(1, 10)
    elif value == 2:
        return random.randint(11, 20)
    else:
        return random.randint(21, 30)

def generate_malware():
    file = open("/data/files/malpedia.json", "r")
    data = json.load(file)
    return random.choices(data["values"])[0]

def get_conn():
    username = os.getenv('PG_USER')
    pwd = os.getenv('PG_PASS')
    return psycopg.connect(f"dbname=faketotal user={username} password={pwd} host=postgres port=5432")


def backend_stuff(value):

    ioctype = classify(value)
    if ioctype is None:
        return {"error": "I don't know nothing about it"}
    conn = get_conn()
    try:
        with conn.cursor() as cur:
            cur.execute("SELECT ioc, rating, submit, malware FROM faketotal WHERE ioc = %s;", (value,))
            row = cur.fetchone()

            if row:
                if row[3]:
                    malw = json.loads(row[3])
                else:
                    malw = []
                try:
                    submit_date = row[2].strftime("%Y-%m-%d %H:%M:%S")
                except:
                    submit_date = row[2]
                res_data = {
                    "ioc": row[0],
                    "rating": row[1],
                    "submit": submit_date,
                    "malware": malw,
                    "error": None,
                    "type": ioctype,
                }
                return res_data

            fakestat = generate_stat()
            dt_obj = datetime.now()
            if fakestat > 20:
                malware = generate_malware()
            else:
                malware = []
            cur.execute("INSERT INTO faketotal (ioc, rating, submit, malware) VALUES (%s, %s, %s, %s)",
                (value, fakestat, dt_obj.isoformat(' '), json.dumps(malware),))
            conn.commit()
            res_data = {
                "ioc": value,
                "rating": fakestat,
                "submit": dt_obj.isoformat(' '),
                "malware": malware,
                "error": None,
                "type": ioctype,
            }
            return res_data
    except:
        return {"error": "Something wrong!"}
    finally:
        conn.close()

def return_html_status(resdata):

    if resdata <= 9:
        circle_stat="clean"
    elif 10 <= resdata <= 20:
        circle_stat="suspicious"
    else:
        circle_stat="malicious"
    
    return circle_stat


@app.route("/")
def index():
    return render_template("index.html", result="")


@app.route("/inspect")
def inspect():
    ioc = request.args.get("ioc", "")

    if not ioc:
        return redirect(url_for("index"))

    return redirect(url_for("web", ioc=ioc))


@app.get("/web/<ioc>")
def web(ioc):

    if not ioc:
        return redirect(url_for("index"))

    result = backend_stuff(ioc)
    if result["error"] is None:
        # Criteria:
        # 20% - 0
        # 10% - 1-10
        # 30% - 11-20
        # 40% - 20-30
        result["stat_data"] = return_html_status(result["rating"])
        result["round_prec"] = int(result["rating"] /30 *360)

    return render_template("index.html", result=result)

@app.get("/api/<ioc>")
def api(ioc):

    if not ioc:
        return {redirect(url_for("index"))}

    result = backend_stuff(ioc)
    return result


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True)
