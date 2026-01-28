# csirt-lab (CSIRT Lab Setup)

A dockerized CSIRT lab environment that bundles the core services needed for incident handling, collaboration, and IOC triage.  
This repository brings together **RTIR**, **Mattermost**, **email + webmail**, **Postgres**, and a few helper tools to quickly spin up a realistic workflow for training, demos, development and internal testing.


## What’s included

### RTIR (Request Tracker for Incident Response)
**RTIR** is the primary incident management platform in this lab. It provides structured case handling (incidents, investigations, correspondences), ticketing workflows, and auditability for response activities.

- **Version:** 6.0.2  (RT: 6.0.2, RTIR: 6.0.1)
- **Image/source:** pre-built RTIR image pulled from Docker Hub (already compiled and packaged)
- **Role in the lab:** central place to register incidents, track actions, assign tasks, and document findings.

### Mattermost
**Mattermost** is used for team collaboration and real-time communication during investigations.

- **Role in the lab:** chat channels for incident coordination, quick updates, and cross-team communication.
- Works well alongside RTIR by keeping discussion separate from formal case notes.

### Email (docker-email)
Email services are provided using **docker-email** to simulate a realistic inbound/outbound incident communications flow.

- **Role in the lab:** supports reporting, phishing simulations, notifications, and general message exchange between lab users and RTIR/webmail.
- Useful for testing workflows that depend on receiving or sending emails during incident response.

### Roundcube (Webmail)
**Roundcube** provides a webmail interface for the lab email service.

- **Role in the lab:** allows users to access mailboxes through a browser (helpful for training scenarios and quick testing).
- Convenient for working with email-based incident reports or sample phishing messages.

### Adminer
**Adminer** is a lightweight database management UI.

- **Role in the lab:** easy inspection and administration of the databases used by services in the stack.
- Helpful for troubleshooting, verifying migrations, and quick schema/data checks.

### FakeTotal (Fake VirusTotal)
**FakeTotal** is a deliberately simplified “VirusTotal-like” web app for training and demo purposes.

- **Role in the lab:** IOC lookups without sending real indicators to external services.
- **Behavior:** users can search an IOC (hash/domain/IP/URL), and FakeTotal returns a **rating/reputation** for that IOC.
At this momet only API support. GUI version TBD.

### Postgres

**Postgres** is the database backend used by the stack - RTIR, Mattermost, FakeTotal\
It provides persistent storage for lab data and can be inspected using Adminer.

## Typical workflow (example)
1. A report arrives via **Email / Roundcube**.
2. An incident is created and tracked in **RTIR**.
3. The team coordinates in **Mattermost**.
4. Indicators are checked in **FakeTotal** to get a quick rating.
5. **Adminer** is used if database verification or troubleshooting is needed.

## Default access:

| Service | URL | Users |
| --- | --- | --- |
| RTIR | http://localhost | Admin  <br>root:password  <br><br/>Users:  <br>tony:password  <br>yoda:password  <br>joker:password |
| Roundcube | http://localhost:8082/ | Domain: from .env file. Default: example.local  <br>Password: from .env file. Default: password  <br>RTIR incoming email  <br>rtir@example.local  <br><br/>admin@example.local  <br>tony@example.local  <br>yoda@example.local  <br>joker@example.local  <br>hr@example.local  <br>mm@example.local  <br><br/>gov@gov.local  <br>admin@gov.local  <br><br/>External users:  <br>mix usernames:  <br>admin, root, bot, security, ammy, tori, john, casady, ben, martha, spam  <br>with domains:  <br>gmail.local, mail.local, yahoo.local, icloud.local, outlook.local, proton.local  <br><br/>Example: security@outlook.local, ben@gmail.local |
| Adminer | http://localhost:8081 | user: root  <br>passw: toor  <br>System: PostgreSQL  <br>server: postgres |
| Mattermost | http://localhost:8083/ | You have to start your first setup |
| FakeTotal | http://localhost:8080/ |     |


## Disclaimer
This lab is intended for **training, demos, and internal testing**. It is not for production use!
FakeTotal is **not** a real threat intelligence source and should not be used for production decisions.

