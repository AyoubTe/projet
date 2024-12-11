#!/bin/sh

# Start the router configuration
echo "Starting router..."

# Load the network configuration
source /etc/router-config/router.conf

# Configure the network interfaces and routing
ifconfig $interface_external $ip_eth0 netmask $netmask up
ifconfig $interface_internal $ip_eth1 netmask $netmask up

# Apply the iptables rules
sh /etc/router-config/iptables.sh

# Restart networking services (if necessary)
service networking restart
