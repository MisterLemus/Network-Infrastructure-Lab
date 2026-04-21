#!/bin/bash
# =============================================
# Linux Firewall Configuration (iptables)
# Author: José Carol Lemus Reyes
# Purpose: Server farm firewall rules
# =============================================

# Flush existing rules
iptables -F
iptables -X
iptables -t nat -F

# Default policies - DROP everything
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow established connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# SSH (only from IT VLAN)
iptables -A INPUT -s 192.168.10.0/24 -p tcp --dport 22 -j ACCEPT

# HTTP/HTTPS (from all internal)
iptables -A INPUT -s 192.168.0.0/16 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -s 192.168.0.0/16 -p tcp --dport 443 -j ACCEPT

# DNS
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -j ACCEPT

# DHCP
iptables -A INPUT -p udp --dport 67:68 -j ACCEPT

# ICMP (ping) - rate limited
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT

# Syslog (from network devices)
iptables -A INPUT -s 10.0.0.0/8 -p udp --dport 514 -j ACCEPT

# SNMP (from monitoring)
iptables -A INPUT -s 192.168.10.0/24 -p udp --dport 161 -j ACCEPT

# Log dropped packets
iptables -A INPUT -j LOG --log-prefix "DROPPED: " --log-level 4

# Save rules
iptables-save > /etc/iptables/rules.v4

echo "[+] Firewall rules applied successfully"
echo "[+] Rules saved to /etc/iptables/rules.v4"
iptables -L -n --line-numbers
