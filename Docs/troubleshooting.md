# 🛠️ VoIP Troubleshooting Guide

## 🔊 One-way Audio (No Sound)

**Cause:**  
NAT hiding private IP addresses (RTP not flowing correctly)

**Fix:**
```bash
sudo systemctl status rtpengine-daemon
sudo systemctl restart rtpengine-daemon
```

**Asterisk Configuration:**
```ini
direct_media = no
rtp_symmetric = yes
```

---

## 🔐 Can't Register (401 Unauthorized)

**Cause:**  
- User not present in database  
- Incorrect credentials  

**Fix:**
```bash
mysql -u kamailio -p'kamailiorw' -e "USE kamailio; SELECT username FROM subscriber;"
```

```bash
mysql -u kamailio -p'kamailiorw' -e "USE kamailio; INSERT INTO subscriber (username, domain, password) VALUES ('3001', 'YOUR_IP', 'password123');"
```

---

## 📞 Call Drops Immediately

**Cause:**  
- Kamailio not running  
- Configuration errors  

**Fix:**
```bash
sudo systemctl status kamailio
sudo kamailio -c
sudo systemctl restart kamailio
```

---

## 🌐 Can't Connect to Server

**Cause:**  
AWS Security Group blocking SIP traffic  

**Fix:**
- Add inbound rule:
  - Protocol: UDP  
  - Port: 5060  
  - Source: 0.0.0.0/0  

---

## ❌ 404 Not Found on Call

**Cause:**  
Destination user not registered  

**Fix:**
```bash
mysql -u kamailio -p'kamailiorw' -e "USE kamailio; SELECT username, contact FROM location WHERE username='3003';"
```

---

## ⚠️ Kamailio Won't Start

**Cause:**  
Syntax error in configuration  

**Fix:**
```bash
sudo kamailio -c
sudo cat -n /etc/kamailio/kamailio.cfg | tail -30
```

---

## 🧪 Debugging Checklist

```bash
# Check services
sudo systemctl status kamailio asterisk rtpengine-daemon

# Check listening ports
sudo ss -lntup | grep -E "5060|5062"

# Check registered users (Kamailio)
mysql -u kamailio -p'kamailiorw' -e "USE kamailio; SELECT username, contact FROM location;"

# Check Asterisk contacts
sudo asterisk -rx "pjsip show contacts"

# Live logs
sudo journalctl -u kamailio -f
```

---

## ✅ Final Status

| File                     | Status |
|--------------------------|--------|
| README.md                | ✅     |
| configs/                 | ✅     |
| screenshots/             | ✅     |
| docs/commands.md         | ✅     |
| docs/troubleshooting.md  | ✅     |
