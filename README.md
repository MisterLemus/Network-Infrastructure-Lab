# 🌐 Network Infrastructure Lab - Cisco & Linux

[![CCNA](https://img.shields.io/badge/Cisco-CCNA-1BA0D7?style=for-the-badge&logo=cisco)](https://www.cisco.com/)
[![Linux](https://img.shields.io/badge/Linux-LPIC_1/2/3-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://www.lpi.org/)
[![Packet Tracer](https://img.shields.io/badge/Packet_Tracer-Labs-blue?style=for-the-badge)](https://www.netacad.com/)

> **Enterprise network design, configuration, and troubleshooting labs** demonstrating routing, switching, VLANs, security, and Linux server integration.

---

## 🏗️ Lab Topology

```
                    ┌──────────────┐
                    │   INTERNET   │
                    └──────┬───────┘
                           │
                    ┌──────┴───────┐
                    │  EDGE ROUTER │ R1 (Cisco 2911)
                    │  NAT/PAT     │ OSPF Area 0
                    └──────┬───────┘
                           │ 10.0.0.0/30
                    ┌──────┴───────┐
                    │  CORE SWITCH │ SW-CORE (L3 Switch)
                    │  Inter-VLAN  │ EIGRP + OSPF Redistribution
                    └───┬─────┬───┘
                        │     │
            ┌───────────┘     └───────────┐
     ┌──────┴──────┐              ┌───────┴──────┐
     │  SW-ACCESS1 │              │  SW-ACCESS2  │
     │  VLAN 10,20 │              │  VLAN 30,40  │
     └──────┬──────┘              └───────┬──────┘
            │                              │
    ┌───────┼────────┐            ┌────────┼────────┐
    │       │        │            │        │        │
  [PC1]   [PC2]  [SERVER]     [PC3]    [PC4]   [PRINTER]
 VLAN10  VLAN20  VLAN20      VLAN30   VLAN40   VLAN40
  IT      HR     SERVERS      SALES   MGMT     MGMT
```

---

## 📂 Repository Structure

```
07-Network-Infrastructure-Lab/
├── README.md
├── configs/
│   ├── R1-edge-router.cfg
│   ├── SW-CORE-layer3.cfg
│   ├── SW-ACCESS1.cfg
│   ├── SW-ACCESS2.cfg
│   ├── dhcp-server.conf
│   ├── dns-bind9.conf
│   └── firewall-iptables.sh
├── diagrams/
│   └── network-topology.md
├── scripts/
│   ├── backup-configs.sh
│   ├── network-monitor.sh
│   └── vlan-audit.py
└── docs/
    ├── vlan-design.md
    ├── ip-addressing-scheme.md
    ├── routing-protocol-comparison.md
    ├── acl-security-policies.md
    └── troubleshooting-guide.md
```

---

## 🔧 Technologies & Protocols

| Category | Technologies |
|----------|-------------|
| **Routing** | OSPF, EIGRP, Static Routes, Route Redistribution |
| **Switching** | VLANs, Trunking (802.1Q), STP (RSTP/PVST+), EtherChannel |
| **Security** | ACLs (Standard/Extended), Port Security, DHCP Snooping, DAI |
| **Services** | DHCP, DNS (BIND9), NAT/PAT, NTP, Syslog, SNMP |
| **WAN** | PPP, Frame Relay, GRE Tunnels, VPN (IPSec) |
| **IPv6** | Dual-stack, OSPFv3, DHCPv6 |
| **Linux** | Ubuntu Server, CentOS, BIND9, iptables/nftables, Apache |
| **Monitoring** | Nagios, SNMP, Syslog, NetFlow |
| **Tools** | Cisco Packet Tracer, GNS3, Wireshark, Nmap |

---

## 📋 IP Addressing Scheme

| VLAN | Name | Network | Gateway | DHCP Range |
|:----:|------|---------|---------|------------|
| 10 | IT | 192.168.10.0/24 | .1 | .100-.200 |
| 20 | HR | 192.168.20.0/24 | .1 | .100-.200 |
| 30 | Sales | 192.168.30.0/24 | .1 | .100-.200 |
| 40 | Management | 192.168.40.0/24 | .1 | .100-.200 |
| 99 | Native/Trunk | 192.168.99.0/24 | .1 | N/A |
| 100 | Servers | 10.10.100.0/24 | .1 | Static only |

---

## 🎓 Skills & Certifications

- **CCNA** - Cisco Certified Network Associate
- **LPIC-1** - Linux System Administrator
- **LPIC-2** - Linux Network Professional
- **LPIC-3** - Linux Enterprise Professional

---

## 📝 Author

**José Carol Lemus Reyes**  
Network Engineer | Cybersecurity Analyst  
CCNA | LPIC 1/2/3
