# IP Addressing Scheme

## Network Summary
| VLAN | Department | Network | Subnet | Gateway | DHCP Pool | Hosts |
|:----:|-----------|---------|--------|---------|-----------|:-----:|
| 10 | IT | 192.168.10.0 | /24 | .1 | .100-.200 | 254 |
| 20 | HR | 192.168.20.0 | /24 | .1 | .100-.200 | 254 |
| 30 | Sales | 192.168.30.0 | /24 | .1 | .100-.200 | 254 |
| 40 | Management | 192.168.40.0 | /24 | .1 | .100-.200 | 254 |
| 99 | Native | 192.168.99.0 | /24 | .1 | N/A | N/A |
| 100 | Servers | 10.10.100.0 | /24 | .1 | Static | 254 |

## Static Assignments
| Device | IP | VLAN | Purpose |
|--------|---------|:----:|---------|
| R1 WAN | DHCP | - | ISP Connection |
| R1 LAN | 10.0.0.1 | - | Core uplink |
| SW-CORE | 10.0.0.2 | - | Core switch |
| DNS Server | 10.10.100.5 | 100 | BIND9 |
| DHCP Server | 10.10.100.6 | 100 | ISC DHCP |
| Syslog | 10.10.100.10 | 100 | Log collection |
| Web Server | 10.10.100.20 | 100 | Apache/Nginx |

## WAN Links
| Link | Network | Mask |
|------|---------|------|
| R1 ↔ SW-CORE | 10.0.0.0 | /30 |
