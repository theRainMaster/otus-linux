#!/bin/bash

echo "Install RAID file."

echo "Display before installation."
sudo lshw -short | grep disk
# Let's zero the superblocks just in case:
mdadm --zero-superblock --force /dev/sd{b,c,d,e,f,g}
# Remove older kernels (Only for demo! Not Production!)
mdadm --create --verbose /dev/md0 -l 6 -n 6 /dev/sd{b,c,d,e,f,g}
echo "Checking RAID System Information."
cat /proc/mdstat
mdadm -D /dev/md0

echo "RAID INSTALL DONE."