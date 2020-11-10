#!/bin/bash

echo "Create mdadm file."

#Checking Disk System Information
mdadm --detail --scan --verbose
#Create mdadm.conf file
mkdir -p /etc/mdadm/mdadm.conf
echo "DEVICE partitions" > /etc/mdadm/mdadm.conf
mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm/mdadm.conf
#Checking Disk System Information
cat /etc/mdadm/mdadm.conf 

echo "MDADM FILE DONE."