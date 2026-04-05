# 🎙️ VoIP Communication Platform

> I built a working VoIP phone system from scratch on AWS EC2 using Kamailio, Asterisk, and RTPengine

[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Kamailio](https://img.shields.io/badge/Kamailio-6.0-red.svg)](https://kamailio.org)
[![Asterisk](https://img.shields.io/badge/Asterisk-20.6-blue.svg)](https://asterisk.org)

---

## 🎯 What I Did

I built a **working VoIP system** to understand how SIP phones work in the cloud.

### What I Configured:

- **Kamailio** as SIP Proxy (port 5060) - handles registration
- **Asterisk** as PBX (port 5062) - handles call routing
- **RTPengine** as Media Proxy - fixes audio issues
- **MySQL** as database - stores user credentials
- **AWS EC2** as cloud server - deployed everything

---

## 🏗️ Architecture Diagram

```mermaid
flowchart TD
    A[Internet] --> B[AWS EC2 Cloud]
    B --> C[Kamailio :5060]
    C --> D[Asterisk :5062]
    D --> E[Agent 3003]
    D --> F[Agent 3004]
    C <--> G[RTPengine]
    C <--> H[(MySQL)]
