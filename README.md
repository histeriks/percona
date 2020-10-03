#   Percona XtraDB Cluster Installation Automation script

This script should be ran as root on fresh & clean Ubuntu 20 virtual machines, or so called *droplets* if DigitalOcean is your playground!

Prepare three of those and then on the first one edit swoosh.sh on lines 26 to 29, adjust IP address, hostname, cluster name & set desired sstuser's password, save the file & make it executable with:

> chmod +x swoosh.sh

After doing so on node1, run ``./swoosh.sh`` to execute it and follow instructions (set mysql root password etc). 

Add sstuser by logging in into mysql with:

> mysql -u root -p(mysql-root-password-you-chose-during-installation-here)

While in mysql console, create sstuser, set it's password and give it appropriate rights with:

>CREATE USER 'sstuser'@'localhost' IDENTIFIED BY 'SET-SST-PASSWORD-HERE';

>GRANT RELOAD, LOCK TABLES, PROCESS, REPLICATION CLIENT ON *.* TO 'sstuser'@'localhost';

>FLUSH PRIVILEGES;

Bootstrap the cluster with:

/etc/init.d/mysql bootstrap-pxc

If for any reason bootstrapping fails, try with some of these:

>service mysql bootstrap-pxc

>service mysql start --wsrep_new_cluster

>service mysql start --wsrep-cluster-address="gcomm://"

>systemctl start mysql@bootstrap.service

On next 2 cluster nodes, edit swoosh.sh, uncomment row 18 adjusting addresses to ones of your nodes, comment row 19 & again change lines 26 to 29, then make it executable & run.


