<!-- ========================= -->
<!--        CSIRT LAB          -->
<!-- ========================= -->

<div align="center">

# 🧪 csirt-lab  
### Dockerized CSIRT Lab Setup (RTIR • Mattermost • Mail • Postgres • IOC Triage)

A dockerized CSIRT lab environment bundling the core services needed for **incident handling**, **collaboration**, and **IOC triage**.  
Spin up a realistic workflow for **training**, **demos**, **development**, and **internal testing**.

<br/>

![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&logoColor=white)
![Postgres](https://img.shields.io/badge/PostgreSQL-18.alpine3.22-0058CC?logo=postgresql&logoColor=white)
![Mattermost](https://img.shields.io/badge/Mattermost-11.3.0-0058CC?logo=mattermost&logoColor=white)
![RT](https://img.shields.io/badge/RT-6.0.2-0058CC?logo=data:image/svg%2bxml;base64,iVBORw0KGgoAAAANSUhEUgAAADEAAAAvCAYAAABKQCL3AAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAdnJLH8AAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB+oBHgoPBpXBp3QAAAcpSURBVGje7VldTFvnGT6mnfKj7CaZ1HJRTUPaRXuT22hJpGi9aTRVitZKJetammrJphUV2kkhKIgqWwMhZIFCMmEb7KWTOgOJMomYJkD4s0mLD05wdg6uXWRjjGXw37F9foztc75nF4nP6nXTjtMd3yzvHUh+vvf5vvd5/w5FPbWn9tT+qzU1NePUqd/gSX8P4Mjs7OzI4OAgquGv4V//cfFid9tLL734h5qaGspgMFBHjx41VAoqCMJVAL/d3t6mYrEYVVtb+6O9e/euVeUFenp6G+rrjyMUCkFRFGSzWUxMTODKlSs/rQTH6XQil9sGIQQ8L2B+fh4LCwtDevld880/eJ7/mcHw6OINBgO1Z88e6uDBg9T+/fvvGo2mu1pBvV4vlcmkKVmWqd27d1EHDhyg6urq3h0dvZ6oymsMDVm+Pzc3B0nKAQAIIRAEAQzDYHh4WNCKYzabwbIsCoWCiiOKIrxeLwDUVoXMysoKstksFEUBIQSyLCOZTIGmlzSL1Wr9M9bW1pDP51EyURQrwvjOZrFY4ff7kc/nQQgBAGSzWSwsLGh2oqvrInw+P0RRhKIoAACO4+Dz+QDg51UhYrPZtlmWhSRJUJRHRCRJwvLyMkKh0K+0YHR0dPabTGasrKwgk8lAURQUCgUwDIPu7kunq0Kku7v7tM1mQyKRUF9ElmXE43F4vd5bWjBMJvMP33rrbbAsq76sIAgIBAKYmZmVqhZe09MziMfjqk4IIdjc3MTU1JTm8BocHMTS0hJisZiKw/M8VldXq6kTCwKBgHqbhBBEo1HcuXNHsxMnT56Cy+VCJpNRX5bjOIyMjFSPyPnz59WwKN0mx3Fwu92anejp+WRzbGwMgiCUvYjL5YLb7f5JVYiMjl5PuFwupFIp9Tbz+Tzm5ubx+ee339aC0d7ePm80mlStEUKQy+Xg8/kxMTExVRUily/3nLTZbGWFkeM4OJ1OtLSciWnFoWlaDa1STdra2sLY2Fi+KkTMZnPtV1/5ysIinU6Dpml8+OHvNIfX+Pg4otEoZFkGACiKgng8jnv37lVX8H6/X3VCkiTQNI2Ghnc0O3Ht2jWsra0hl8upIRqPx8EwTPUK46ef/gUcx6kOCIIAll2piEhnZxdmZmYQDoeRTCahKApkWQbHcRBFsbcqRB48WA4kk0mViCRJGBqy4LXXXkd//5VXtBbXN96ox+3bt8tEL0kSwuGNxao0kC4X3SOKYln3GgqFMDAwAKPR+GOt3XR9/S8wOTkJSZLKOupgMMgAOKI7EQDWTCajdq+yLMPhcKCz88IfK8FpbGzE0tIStre3VcGLoqh8k0SNbnOvwXAiEolQhBB1yKIoinr22We2KsHZt+8HZcNYTU0NJYpi/j9Odv9jbeC5555Xned5nmJZlioW5Re0YrS3fzR/+PChl+vq6qgdO3ZQhBAqlUpRoVDoewaDYVbXULJareB5Xg2lUt14881fVpClOkHTNCRJAiFErRufffZXfeuGxWLZabfbsb6+rg5AuVwOdvs4GhsbNR/e0PAOaJpGKTmUhjGLxaovgampqddpmoYgCGpKFEURPp8PLS0tmlsQm20YDx8+RCKRUDMSz/Pwer36Emhv/2je4XB86+YcDgdu3LjRqjUtMwwDSZIgy7LavgQCAXz55eLXeqbR2uXlZRKNRpHNZtUCx/M8aJqGxWLdqQWnra3N7fF4ymZ5URThdDrR19f3qp4Ejvj9XyOXy5UJOBAIVtS0NTU1w+VyqTiEEGQyGXg8Hv1XO6WhqHRwOp2Gw+HEe+9pF7DFYsHk5KQ6kxBCkEwmMTp6Xd/47+vrf9Vms0EU/5n6Njc3Ybfbce7cub9pnLP3jY+PIx6Po1AoQJYVFItFcBwHh8OpL4GzZ9v+PjBgRDAYLNshGY1GdHV1/V4LxqVLl5rtdntZY1csFsEwDG7evBnQlcD77zfBbDYjFAqhWCyqo6TH49F8c62tZ4Otra0IBoNlq5+NjQ1sbGw06ErgxIl3MTg4iFAopKa/QqEAlmU1i6+xsRE22zCi0U01C0mSVNoE6tuRmkwmsOzK4w2gohJYX1/XfHh9/XHQNI1EIqFibG3FMDc3p28G6u395PitW3aEw2EUi8WyhXAgEOC0Epienobf7y9bJmSzWTx4sKyvgM+cORO5e3ca6XRaFV+p/KdSqS+0XULv8bGxsW9hiKKI1dXVJV0JjIyMcDRNg+f5soMfx/+vtWBcuHCBNRpNCIfDZWuYSCQCURQ7dA2h5uYPwDBM2YpSkiQsLi5qfvrLl3tOnj7dArfbrepIEIRSBdZ/pKSoRx9XZFl+/FElifv371csvo8/Pg+Xi0Y6nUYkEqnoe8YTTZH/pidq9vv9PRRFUbFY/N7hw4cOPkFftcdqtfK7du2mdu7ckTl27NiLBoMhSlXTrl7906GOjs7+754gWiPUU/s/sn8Atxp0FTkQ8dMAAAAASUVORK5CYII=)
![RT-IR](https://img.shields.io/badge/RTIR-6.0.1-0058CC?logo=data:image/svg%2bxml;base64,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)
![Email](https://img.shields.io/badge/docker%20mailserver-15.1.0-0058CC?logo=data:image/svg%2bxml;base64,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)
![Roundcube](https://img.shields.io/badge/Roundcube-1.6.12-0058CC?logo=roundcube&logoColor=white)
![Adminer](https://img.shields.io/badge/Adminer-5.4.1-0058CC?logo=adminer&logoColor=white)
![FakeTotal](https://img.shields.io/badge/FakeTotal-API-green)


</div>

---

## ✨ What’s inside

This lab brings together:

- **🧾 RTIR** — incident & investigation tracking
- **💬 Mattermost** — coordination & chat channels
- **✉️ Email stack (docker-email)** — inbound/outbound incident comms
- **📬 Roundcube** — webmail for training scenarios
- **🗄️ Postgres** — persistent storage backend
- **🛠️ Adminer** — quick DB inspection & troubleshooting
- **🧪 FakeTotal** — local “VirusTotal-like” IOC reputation lookup (training-safe)

---

## 🧩 Components

### 🧾 RTIR (Request Tracker for Incident Response)
**RTIR** is the primary incident management platform in this lab. It supports structured case handling (incidents, investigations, correspondences), ticket workflows, and auditability.

- **Version:** `6.0.2`  *(RT: 6.0.2, RTIR: 6.0.1)*
- **Image/source:** pre-built RTIR image pulled from Docker Hub (already compiled and packaged)
- **Role in the lab:** central place to register incidents, track actions, assign tasks, and document findings

---

### 💬 Mattermost
**Mattermost** is used for team collaboration and real-time communication during investigations.

- **Role in the lab:** chat channels for incident coordination, quick updates, and cross-team communication  
- Works well alongside RTIR by keeping discussion separate from formal case notes

---

### ✉️ Email (docker-email)
Email services are provided using **docker-email** to simulate realistic inbound/outbound incident communications.

- **Role in the lab:** reporting, phishing simulations, notifications, message exchange between lab users and RTIR/webmail  
- Useful for testing workflows that depend on sending/receiving emails during incident response

---

### 📬 Roundcube (Webmail)
**Roundcube** provides a webmail interface for the lab email service.

- **Role in the lab:** browser access to mailboxes (great for training scenarios and quick testing)
- Convenient for email-based incident reports or sample phishing messages

---

### 🛠️ Adminer
**Adminer** is a lightweight database management UI.

- **Role in the lab:** inspect and administer the databases used by services in the stack
- Helpful for troubleshooting, verifying migrations, and quick schema/data checks

---

### 🧪 FakeTotal (Fake VirusTotal)
**FakeTotal** is a deliberately simplified “VirusTotal-like” web app for training and demo purposes.

- **Role in the lab:** IOC lookups *without* sending indicators to external services
- **Behavior:** search an IOC (hash/domain/IP/URL) → get a **rating/reputation**
- **Status:** API-only at the moment; **GUI TBD**

> ✅ Designed for **safe training**: no real indicators are leaked externally.

---

### 🗄️ Postgres
**Postgres** is the database backend for the stack (**RTIR**, **Mattermost**, **FakeTotal**).  
It provides persistent storage and can be inspected via **Adminer**.

---

## 🧭 Typical workflow (example)

1. A report arrives via **Email / Roundcube**
2. An incident is created and tracked in **RTIR**
3. The team coordinates in **Mattermost**
4. Indicators are checked in **FakeTotal** for a quick rating
5. **Adminer** is used if DB verification or troubleshooting is needed

---

## 🔐 Default access


### 📍 Service endpoints & users

| Service | URL | Default users / notes |
| --- | --- | --- |
| **RTIR** | `http://localhost` | **Admin:** `root:password` <br><br>**Users:** `tony:password`, `yoda:password`, `joker:password` |
| **Roundcube** | `http://localhost:8082/` | **Domain:** from `.env` (default: `example.test`) <br>**Password:** from `.env` (default: `password`) <br><br>**RTIR incoming:** `rtir@example.test` <br><br>**Mailboxes:** `admin@...`, `tony@...`, `yoda@...`, `joker@...`, `hr@...`, `mm@...` <br><br>**gov:** `gov@gov.test`, `admin@gov.test` <br><br>**External users:** mix usernames (`admin`, `root`, `bot`, `security`, `ammy`, `tori`, `john`, `casady`, `ben`, `martha`, `spam`) with domains (`gmail.test`, `mail.test`, `yahoo.test`, `icloud.test`, `outlook.test`, `proton.test`) <br>Example: `security@outlook.test`, `ben@gmail.test` |
| **Adminer** | `http://localhost:8081` | **user:** `root` <br>**pass:** `toor` <br>**System:** PostgreSQL <br>**server:** `postgres` |
| **Mattermost** | `http://localhost:8083/` | First-time setup required |
| **FakeTotal** | `http://localhost:8080/` | API-only for now |

---

## ⚠️ Disclaimer

This lab is intended for **training, demos, and internal testing** only — **not production use**.  
**FakeTotal** is **not** a real threat intelligence source and must not be used for production decisions.

