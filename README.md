# voip-sip-platform
Complete VoIP system with Kamailio, Asterisk, RTPengine on AWS

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
