#   Percona XtraDB Cluster Installation Automation script

This script should be ran as root on fresh & clean Ubuntu 20 virtual machines, or so called *droplets* if DigitalOcean is your playground!

Prepare three of those, adjust IP addresses etc & make the file executable with:

> chmod +x swoosh.sh

After doing so, run ``./swoosh.sh`` to execute it on node1. 

On next 2 cluster nodes uncomment row 18, comment row 19 & change addresses & names on rows 24 & 25, then make it executable & run.

Add sstuser on node1 before running it on nodes 2 & 3, by logging in into mysql with:

> mysql -u root -p(mysql-root-password-you-chose-during-installation-here)

While in mysql console, create sstuser, set it's password and give it appropriate rights with:

> CREATE USER 'sstuser'@'localhost' IDENTIFIED BY 'SET-SST-PASSWORD-HERE';
> GRANT RELOAD, LOCK TABLES, PROCESS, REPLICATION CLIENT ON *.* TO 'sstuser'@'localhost';
> FLUSH PRIVILEGES;
