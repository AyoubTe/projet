#!/bin/sh

# Clear existing rules
iptables -F
iptables -t nat -F

# Configure NAT to mask the clients' IPs behind the router
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Allow incoming traffic on eth0
iptables -A INPUT -i eth0 -j ACCEPT

# Allow outgoing traffic on eth0
iptables -A OUTPUT -o eth0 -j ACCEPT

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Save the iptables rules to persist after reboot
service iptables save
