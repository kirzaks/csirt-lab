# todo noņemt visus request:...
incidents = [
  {
    "subject": "Suspected phishing: 'Microsoft 365 password expires today'",
    "body": "Hi CSIRT,\n\nI got an email saying my Microsoft 365 password expires today and I need to “keep my account active”. The button took me to a weird site (not Microsoft). I clicked but did NOT enter my password.\n\nCan you check if it’s phishing and let me know what to do next?\n\nhttps://the-real-microsoft.test/\n\nThanks!",
    "source": "user",
    "time": "2025-06-28 18:40:42",
    "actions": {
      "user": 0,
      "incident": True,
      "replay": "Yes, it is phishing site. Thanks for the report",
      "comment": "Site is not active now"
    }
  },
  {
    "subject": "VPN brute-force indicators for user aelis",
    "body": "SIEM alert: 186 failed VPN logins for user aelis between 02:10–02:27 (EET), followed by 1 successful login.\nSource IP geolocates to an unusual country for this user.\nSession lasted ~4 minutes; ~12MB transferred.\nWhat do you need from us now for Incident investigation?",
    "source": "admin",
    "time": "2025-05-14 18:09:02",
    "actions": {
      "user": 1,
      "incident": True,
      "priority": "High",
      "replay": "Yes, send please all logs!"
    }
  },
  {
    "subject": "EDR quarantined Trojan on WS-044",
    "body": "EDR detected Trojan.Generic on WS-044 at 11:03.\nFile: C:\\Users\\<user>\\Downloads\\invoice_2026.pdf.exe\nEDR quarantined the file. No other detections so far.",
    "source": "automated",
    "time": "2026-01-05 12:37:19",
    "actions": {
      "user": 2,
      "comment": "No actions needed. Resolve",
      "resolved": True
    }
  },
  {
    "subject": "Suspicious PowerShell: EncodedCommand on HR-WS-012",
    "body": "Sysmon alert: powershell.exe launched with -EncodedCommand under user trixy at 18:42.\nChild process: rundll32.exe\nNetwork: attempted outbound to external IP over 443.",
    "source": "automated",
    "time": "2025-11-13 18:07:58",
    "actions": {
      "priority": "High",
      "user": 0,
      "rejected": True
    }
  },
  {
    "subject": "Urgent payment request email impersonating CFO",
    "body": "Accounts Payable received an email from display name “CFO Office” requesting a bank account change and same-day transfer.\nSender domain looks like a typo of our real domain.\nWe did not process the request.",
    "source": "user",
    "time": "2025-11-04 21:57:15"
  },
  {
    "subject": "I can't access website",
    "body": "Hi,\n\nI can't access web page http://definitely-not-fake-shop.test. Browser is redirecting me to some weird web page... Are you something blocking?\n\nThanks",
    "source": "user",
    "time": "2025-08-11 22:41:11",
    "actions": {
      "user": 1,
      "rejected": True
    }
  },
  {
    "subject": "🔥 You WON a $500 Gift Card! Claim in 15 minutes",
    "body": "CONGRATS!!! Your email was selected for a $500 gift card.\nClick NOW to claim before it expires: http://bonus-reward-claim.test\n(Do not share this link)\n\nSTOP receiving? Reply with your password to unsubscribe.",
    "source": "goodspam",
    "time": "2025-04-06 21:44:04",
    "actions": {
      "user": 2,
      "comment": "SPAM!",
      "resolved": True
    }
  },
  {
    "subject": "Possible public exposure: cloud storage container accessible without auth",
    "body": "Security scan flagged cloud storage container 'company-exports-prod' as publicly readable.\nObserved filenames include customer_export_2025_12.csv.",
    "source": "automated",
    "time": "2025-02-15 11:16:41"
  },
  {
    "subject": "DLP alert: large upload to unknown file-sharing domain",
    "body": "DLP triggered for user taros uploading ~2.1GB to robinhood.infoshare.test over HTTPS.",
    "source": "automated",
    "time": "2025-07-08 07:04:09"
  },
  {
    "subject": "Ransom note found on PC",
    "body": "Restore-My-Files.txt appears in user PC. Files are encrypted and show unusual extensions - lockbit. How to decrypt files?",
    "source": "admin",
    "time": "2025-09-10 09:43:54",
    "actions": {
      "user": 0,
      "incident": True,
      "priority": "Medium",
      "replay": "Just save PC HDD somewhere and whait for decryptor tool. At this moment is is not possible to decrypt",
      "resolved": True
    }
  },
  {
    "subject": "Invoice overdue - FINAL NOTICE (action required)",
    "body": "Dear Customer,\n\nYour invoice is overdue. Immediate action required.\nOpen attachment to avoid legal escalation.\n\nRegards,\nBilling Dept\n\nAttachment: invoice.zip",
    "source": "goodspam",
    "time": "2025-08-11 21:23:19"
  },
  {
    "subject": "Mailbox rule created + external forwarding enabled (sales.lead)",
    "body": "M365 audit logs show a new inbox rule for sales.lead: if subject contains 'invoice' move to RSS Feeds and mark as read.\nAutomatic forwarding set to an external address.\nUser reports they did not create this.",
    "source": "admin",
    "time": "2025-05-30 19:25:53",
    "actions": {
      "user": 1,
      "rejected": True
    }
  },
  {
    "subject": "Invite to Black Hack Underground event",
    "body": "Hi,\n\nI would like to invite you to our conference Black Hat Underground. We will hack hackers ;)\n\nThanks",
    "source": "user",
    "time": "2025-04-24 05:16:16",
    "actions": {
      "user": 3,
      "general": True,
      "priority": "Medium"
    }
  },
  {
    "subject": "Monthly Incident Report",
    "body": "Summary of incidents during the month:\n\n- DDoS attacks\n- Ransomware\n- Exploits",
    "source": "automated",
    "time": "2025-01-31 00:00:19",
    "actions": {
      "user": 0,
      "general": True
    }
  },
  {
    "subject": "Important meeting",
    "body": "Important meeting will happen tommorow at 15:00",
    "source": "admin",
    "time": "2025-02-22 12:19:46",
    "actions": {
      "user": 1,
      "general": True,
      "resolved": True,
      "priority": "High"
    }
  },
  {
    "subject": "CEO Needs You: confidential task (reply ASAP)",
    "body": "Hello,\n\nI am in a meeting and need you to buy gift cards quickly. Reply with your phone number.\n\nSent from my iPhone\n\n-CEO",
    "source": "badspam",
    "time": "2025-04-25 00:09:51",
    "actions": {
      "user": 2,
      "rejected": True
    }
  },
  {
    "subject": "Azure AD: Admin role assigned outside change window",
    "body": "Audit log indicates user it.contractor2 was granted Global Administrator at 03:18 and removed at 03:26.\nNo approved change record found.Confirm legitimacy, identify actor who granted role, review sign-in logs, verify conditional access events, and assess possible privilege escalation.",
    "source": "admin",
    "time": "2025-01-27 05:23:44"
  },
  {
    "subject": "Possible website defacement: homepage content briefly changed",
    "body": "Marketing observed the public homepage showing an unauthorized banner for ~5 minutes, then reverting.",
    "source": "user",
    "time": "2025-10-13 08:35:56",
    "actions": {
      "user": 0,
      "incident": True,
      "replay": "Hi, thanks for the report. Please, restore web page from your backup and update CMS",
      "comment": "Web page restored and updated",
      "resolved": True

    }
  },
  {
    "subject": "Password spray attempt detected across multiple O365 accounts",
    "body": "Identity protection flagged password spray: single source IP attempted logins across ~45 accounts over ~20 minutes.\nSeveral lockouts; no confirmed successful logins yet.",
    "source": "automated",
    "time": "2025-10-20 19:45:15"
  },
  {
    "subject": "⚠️ Your mailbox storage is full (increase now)",
    "body": "Your mailbox has exceeded storage limit.\nRe-validate to avoid suspension: http://mail-quota-update.test\n\nIT Support Team",
    "source": "goodspam",
    "time": "2025-04-10 11:53:24",
    "actions": {
      "user": 1,
      "incident": True,
      "comment": "URL reported and blocked",
      "resolved": True
    }
  },
  {
    "subject": "Unapproved OAuth app granted access to M365 data",
    "body": "Tenant alert: user ops.manager granted consent to OAuth app 'Email Productivity Suite'.\nRequested permissions include Mail.Read, Files.ReadWrite.All, offline_access.",
    "source": "automated",
    "time": "2026-01-11 09:12:01",
    "actions": {
      "user": 2,
      "incident": True,
      "comment": "Requested access logs for investigation",
      "priority": "High"
    }
  },
  {
    "subject": "I clicked a link in a weird email - do I need to do anything?",
    "body": "Hi CSIRT,\n\nI clicked a link in an email that looked like a delivery notification. It opened a page and then I closed it. I didn’t download anything (I think).\n\nDo I need to reset my password or run anything?\n\nThanks",
    "source": "user",
    "time": "2026-01-18 15:49:36",
    "actions": {
      "user": 2,
      "rejected": True
    }
  },
  {
    "subject": "Internal port scanning detected from DEV-WS-033",
    "body": "Netflow/IDS indicates DEV-WS-033 scanned multiple internal subnets on ports 22/3389/445 for ~12 minutes.\nUser claims it was 'testing connectivity' but no approval exists.",
    "source": "admin",
    "time": "2026-01-30 12:04:50"
  },
  {
    "subject": "Suspicious scheduled task created on OPS-SRV-07",
    "body": "Windows logs show scheduled task 'SystemHealthMonitor' created at 01:55.\nCommand: cmd.exe /c powershell -w hidden ... (truncated)\nRuns every 15 minutes.\nNo change ticket found.",
    "source": "automated",
    "time": "2026-01-07 15:49:28",
    "actions": {
      "user": 0,
      "priority": "Medium"
    }
  },
  {
    "subject": "Work from home and earn €3,000/week!!!",
    "body": "Hello friend,\n\nWe offer remote job opportunity. Earn €3,000/week with no experience.\nRegister now: http://easy-money-job.example\n\nLimited slots!",
    "source": "goodspam",
    "time": "2025-12-30 16:32:47"
  },

  {
    "subject": "Re: Document shared with you (View now)",
    "body": "A document has been shared with you.\nView secure document here: http://drive-share-auth.test\n\nThis link will expire soon.",
    "source": "user",
    "time": "2025-08-17 10:52:30",
    "actions": {
      "user": 1,
      "incident": True,
      "comment": "Another cred harvester SPAM. URL blocked and reported",
      "resolved": True
    }
  },
  {
	"subject": "Re: hand-made stainless sink",
    "body": "Dear Sir,\n\nGood morning! Since we met last time in Paris. It have been sooooo long time. How are you?\nI have prepared one item for you, just not sure if you like it, could you please let me know after checking?\n\nItem Code:50dd, PRICE FOB 19.99 USD\nsize: 500*400*210mm;\nMaterial: 201 stainless;\npackage: carton;\ncolor: metal black;\nthickness: 3.0MM",
    "source": "badspam",
    "time": "2025-12-07 02:29:45",
    "actions": {
      "user": 2,
      "rejected": True,
    }
  },
  {
	"subject": "Your Compensation/Grant Payment.",
    "body": "Attn: Your Compensation/Grant Payment.\n\nMy name is Mr. George McConnell, i wish to inform you you that at the recently concluded meeting with the International Monetary Fund in collaboration with The U.S. Department of the Treasury regarding global financial matters, after reviewing various unclaimed funds from some of the financial institutions your email has been selected to receive compensation/Grant funds worth of US$1,200,000.00 in the ongoing January 2026 compensation/grant programme.\n\nFor claim kindly contact Mr. Chris Washington via email (chriswashington@aliyun.test) fill and send the below information to him for verification and after verification of your information, you will be contacted with detailed information of procedures for the payment of your compensation/Grant funds.\n\n* Full Name:\n* Gender:\n* Residential address:\n* Country:\n* Direct telephone number:\n* Reference Number: IMF/USDT/010/26.\n\nRegards,\n\nMr. George McConnell.\nInternational Monetary Fund Representative",
    "source": "badspam",
    "time": "2025-11-12 12:28:04"
  },
  {
	"subject": "Looking for a reliable financial partner for your business or clients?",
    "body": "Looking for a reliable financial partner for your business or clients?\n\nMoneyTree Finance Limited offers tailored financing solutions, including:\n• Business & corporate loans\n• Investment financing\n• Startup capital\n\nPartner with us and benefit from:\n• FCA registration support\n• Fast decisions\n• Attractive commissions\n\nContact us:",
    "source": "badspam",
    "time": "2026-01-14 01:00:35"
  },
  {
	"subject": "I hacked you",
    "body": "As you may have noticed, I sent you an email from your email account\n\nThis means I have full access to your account\n\nI’ve been watching you for a few months\n\nThe thing is, you got infected with a njrat through an adult site you visited\n\nIf you don’t know about this, let me explain\n\nThe njrat gives me full access and control over your device.\n\nThis means I can see everything on your screen, turn on the camera and microphone, but you don’t know it\n\nI also have access to all your contacts and all your correspondence.\n\nOn the left half of the screen, I made a video showing how you satisfied yourself, on the right half you see the video you watched.\n\nWith a click of a mouse I can send this video to all your emails and contacts on social networks\n\nI can also see access to all your communications and messaging programs that you use.\n\nIf you want to avoid this,\n\nTransfer the amount of 1200 USD to my bitcoin address (\"write buy bitcoin or find for bitcoin exchange if you don’t know\")\n\nAfter payment is received, I will delete the video and you will not hear from me again\n\nI’m giving you 48 hours to pay\n\nDo not forget that I will see you when you open the message, the counter will start\n\nIf I see you’ve shared this message with someone else, the video will be posted immediately",
    "source": "badspam",
    "time": "2025-11-05 01:12:38",
    "mailfrom": "rtir",
    "actions": {
      "user": 0,
      "incident": True,
      "comment": "SPF, DKIM is not configured. Should we?"
    }
  },
  {
    "subject": "Lost corporate laptop reported (Sales) - SALES-019",
    "body": "Employee reports laptop lost during travel.\nDevice: SALES-019 (MDM enrolled). Unsure about last check-in and encryption status.",
    "source": "admin",
    "time": "2025-04-22 01:59:45",
    "actions": {
      "user": 1,
      "incident": True,
      "comment": "Start incident mitigation work",
      "priority": "High"
    }
  },
  {
    "subject": "CEO Needs You: confidential task (reply ASAP)",
    "body": "Hello,\n\nI am in a meeting and need you to buy gift cards quickly. Reply with your phone number.\n\nSent from my iPhone\n\n-CEO",
    "source": "badspam",
    "time": "2025-04-25 00:09:51"
  },
]
