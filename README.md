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
![RT](https://img.shields.io/badge/RT-6.0.2-0058CC?logo=data:image/svg%2bxml;base64,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)
![RT-IR](https://img.shields.io/badge/RTIR-6.0.1-0058CC?logo=data:image/svg%2bxml;base64,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)
![Email](https://img.shields.io/badge/docker%20mailserver-15.1.0-0058CC?logo=gmail&logoColor=white)
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

