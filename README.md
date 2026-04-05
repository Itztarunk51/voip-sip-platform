# 🎙️ VoIP Communication Platform

> A complete SIP-based communication system built from scratch on AWS EC2 with Kamailio, Asterisk, and RTPengine

[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Kamailio](https://img.shields.io/badge/Kamailio-6.0-red.svg)](https://kamailio.org)
[![Asterisk](https://img.shields.io/badge/Asterisk-20.6-blue.svg)](https://asterisk.org)
[![AWS](https://img.shields.io/badge/AWS-EC2-orange.svg)](https://aws.amazon.com)

---

## 📌 What is this?

I built a **working VoIP phone system** from scratch that handles:

- 📞 SIP registration and authentication
- 🔀 Call routing between users and agents
- 🎤 Basic IVR (welcome message)
- 🔊 Two-way audio with NAT traversal
- ☁️ Deployment on AWS EC2

**Think of it as your own private phone system in the cloud.**

---

## 🏗️ Architecture Diagram

```mermaid
flowchart TD
    A[Internet] --> B[AWS EC2 Cloud<br/>13.220.116.58]
    B --> C[Kamailio :5060<br/>SIP Proxy / Registrar<br/>Registration & Auth]
    C -->|SIP :5062| D[Asterisk :5062<br/>PBX / IVR<br/>Call Routing]
    
    D --> E[Agent 3003<br/>Voice Support]
    D --> F[Agent 3004<br/>Network Support]
    
    C <--> G[RTPengine<br/>Media Proxy<br/>NAT Traversal]
    D <--> G
    
    C <--> H[(MySQL<br/>User Database<br/>3001, 3002)]
