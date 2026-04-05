# ⚙️ Complete Command Reference

## 🖥️ Server Setup (AWS EC2)

```bash
# Connect to server
ssh -i TestCCVOIP.pem ubuntu@YOUR_SERVER_IP

# Update system
sudo apt update && sudo apt upgrade -y
```

---

## 📦 Install Software

```bash
# Install Kamailio
sudo apt install kamailio kamailio-mysql-modules -y

# Install Asterisk
sudo apt install asterisk -y

# Install RTPengine
sudo apt install rtpengine rtpengine-utils -y

# Install MySQL
sudo apt install mysql-server -y
```

---

## 🗄️ Database Setup

```bash
# Create database and user
sudo mysql << EOF
CREATE DATABASE kamailio;
CREATE USER 'kamailio'@'localhost' IDENTIFIED BY 'kamailiorw';
GRANT ALL PRIVILEGES ON kamailio.* TO 'kamailio'@'localhost';
FLUSH PRIVILEGES;
EOF
```

```bash
# Create subscriber table
sudo mysql kamailio << EOF
CREATE TABLE subscriber (
    username VARCHAR(64) NOT NULL,
    domain VARCHAR(64) NOT NULL,
    password VARCHAR(25) NOT NULL,
    ha1 VARCHAR(128) NOT NULL,
    PRIMARY KEY (username, domain)
);
EOF
```

```bash
# Add users
sudo mysql kamailio << EOF
INSERT INTO subscriber (username, domain, password, ha1) 
VALUES ('3001', 'YOUR_IP', 'password123', MD5(CONCAT('3001:YOUR_IP:password123')));

INSERT INTO subscriber (username, domain, password, ha1) 
VALUES ('3002', 'YOUR_IP', 'password123', MD5(CONCAT('3002:YOUR_IP:password123')));
EOF
```

---

## ⚙️ Configuration Files

```bash
# Kamailio config
sudo nano /etc/kamailio/kamailio.cfg

# Asterisk configs
sudo nano /etc/asterisk/pjsip.conf
sudo nano /etc/asterisk/extensions.conf
sudo nano /etc/asterisk/rtp.conf

# RTPengine config
sudo nano /etc/rtpengine/rtpengine.conf
```

---

## ▶️ Start Services

```bash
# Restart services
sudo systemctl restart kamailio
sudo systemctl restart asterisk
sudo systemctl restart rtpengine-daemon

# Enable auto-start
sudo systemctl enable kamailio asterisk rtpengine-daemon
```

---

## 🔍 Verification Commands

```bash
# Check versions
kamailio -V
asterisk -V
rtpengine --version

# Check ports
sudo ss -lntup | grep -E "5060|5062"

# Check registrations
mysql -u kamailio -p'kamailiorw' -e "USE kamailio; SELECT username, contact FROM location;"
sudo asterisk -rx "pjsip show contacts"

# Check logs
sudo journalctl -u kamailio -f
sudo asterisk -r
```
