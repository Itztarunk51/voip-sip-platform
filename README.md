# 🎙️ VoIP Communication Platform

> A complete SIP-based communication system built from scratch on AWS EC2 with Kamailio, Asterisk, and RTPengine

[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Kamailio](https://img.shields.io/badge/Kamailio-6.0-red.svg)](https://kamailio.org)
[![Asterisk](https://img.shields.io/badge/Asterisk-20.6-blue.svg)](https://asterisk.org)
[![AWS](https://img.shields.io/badge/AWS-EC2-orange.svg)](https://aws.amazon.com)

---

## 📌 What I Built

I built a **working VoIP phone system** from scratch on AWS EC2.

### Components I Configured:

| Component | What I Did |
|-----------|-------------|
| **Kamailio** | Installed and configured as SIP Proxy/Registrar on port 5060 |
| **Asterisk** | Installed and configured as PBX on port 5062 |
| **RTPengine** | Installed and configured as Media Proxy for NAT traversal |
| **MySQL** | Set up database for user authentication |
| **AWS EC2** | Deployed everything on cloud with security groups |

### What I Made Work:

| Feature | Status |
|---------|--------|
| User registration (3001, 3002) | ✅ |
| Agent registration (3003, 3004) | ✅ |
| Kamailio → Asterisk routing | ✅ |
| Basic IVR (welcome message) | ✅ |
| Call 3001 → 3003 (User to Agent) | ✅ |
| Call 3003 → 3001 (Agent to User) | ✅ |
| Two-way audio | ✅ |
| NAT traversal with RTPengine | ✅ |
| MySQL database authentication | ✅ |
| iptables security rules | ✅ |

---

## 🏗️ Architecture Diagram

```mermaid
flowchart TD
    A[Internet] --> B[AWS EC2 Cloud<br/>13.220.116.58]
    B --> C[Kamailio :5060<br/>SIP Proxy / Registrar]
    C -->|SIP :5062| D[Asterisk :5062<br/>PBX / IVR]
    D --> E[Agent 3003<br/>Voice Support]
    D --> F[Agent 3004<br/>Network Support]
    C <--> G[RTPengine<br/>Media Proxy]
    C <--> H[(MySQL<br/>User Database)]
