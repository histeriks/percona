#   Percona XtraDB Cluster Installation Automation script

This script should be ran as root on fresh & clean Ubuntu 20 virtual machines, or so called droplets if DigitalOcean is your playground!

Prepare three of those, adjust IP addresses etc & make the file executable with:

> chmod +x swoosh.sh

After doing so, run ``./swoosh.sh`` to execute it on node1. 

On next 2 cluster nodes uncomment row 18, comment row 19 & change addresses & names on rows 24 & 25 & then make it executable and run.

Add sstuser on node1 before running it on nodes 2 & 3!
