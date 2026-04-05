# Troubleshooting Guide

## One-way Audio (No Sound)

**Cause:** NAT hiding private IP addresses

**Fix:**
```bash
sudo systemctl status rtpengine-daemon
sudo systemctl restart rtpengine-daemon
In Asterisk config, ensure:

direct_media = no

rtp_symmetric = yes

Can't Register (401 Unauthorized)
Cause: User not in database or wrong password

Fix:

bash
mysql -u kamailio -p'kamailiorw' -e "USE kamailio; SELECT username FROM subscriber;"

mysql -u kamailio -p'kamailiorw' -e "USE kamailio; INSERT INTO subscriber (username, domain, password) VALUES ('3001', 'YOUR_IP', 'password123');"
Call Drops Immediately
Cause: Kamailio not running or config error

Fix:

bash
sudo systemctl status kamailio
sudo kamailio -c
sudo systemctl restart kamailio
Can't Connect to Server
Cause: AWS Security Group blocking port

Fix: Add inbound rule: UDP port 5060 from 0.0.0.0/0

404 Not Found on Call
Cause: Destination not registered

Fix:

bash
mysql -u kamailio -p'kamailiorw' -e "USE kamailio; SELECT username, contact FROM location WHERE username='3003';"
Kamailio Won't Start
Cause: Syntax error in config

Fix:

bash
sudo kamailio -c
sudo cat -n /etc/kamailio/kamailio.cfg | tail -30
Debugging Checklist
bash
sudo systemctl status kamailio asterisk rtpengine-daemon
sudo ss -lntup | grep -E "5060|5062"
mysql -u kamailio -p'kamailiorw' -e "USE kamailio; SELECT username, contact FROM location;"
sudo asterisk -rx "pjsip show contacts"
sudo journalctl -u kamailio -f
text

---

## ✅ Final Status

| File | Status |
|------|--------|
| README.md | ✅ |
| configs/ | ✅ |
| screenshots/ | ✅ |
| docs/commands.md | ✅ |
| docs/troubleshooting.md | ⏳ Create now |

---