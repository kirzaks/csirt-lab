import json
from flask import Flask, request, jsonify
import random
import psycopg
from datetime import datetime
import json
import os

app = Flask(__name__)

def generate_stat():
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
    return psycopg.connect("dbname=faketotal user=root password=toor host=postgres port=5432")


@app.route("/")
def index():
    return "Please use /api?ioc=\n"
@app.get("/api")
def api():
    ioc = request.args.get("ioc")
    if not ioc:
        return "Please use /api?ioc=\n"

    conn = get_conn()
    try:
        with conn.cursor() as cur:
            cur.execute("SELECT ioc, rating, submit, malware FROM faketotal WHERE ioc = %s;", (ioc,))
            row = cur.fetchone()

            if row:
                if row[3]:
                    malw = json.loads(row[3])
                else:
                    malw = None

                res_data = {
                    "ioc": row[0],
                    "rating": row[1],
                    "submit": row[2],
                    "malware": malw
                }
                return res_data, 200

            fakestat = generate_stat()
            dt_obj = datetime.now()
            if fakestat > 20:
                malware = generate_malware()
            else:
                malware = None
            cur.execute("INSERT INTO faketotal (ioc, rating, submit, malware) VALUES (%s, %s, %s, %s)",
                (ioc, fakestat, dt_obj.isoformat(' '), json.dumps(malware),))
            conn.commit()
            res_data = {
                "ioc": ioc,
                "rating": fakestat,
                "submit": dt_obj.isoformat(' '),
                "malware": malware
            }
            return res_data, 200

    finally:
        conn.close()

    # Check DB for IOC

    # If no records: generate new, save and return
    fakestat = generate_stat()

    # Criteria:
    # 20% - 0
    # 10% - 1-10
    # 30% - 11-20
    # 40% - 20-30

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True)
