#!/bin/bash
#############################################
#-+-+-+ Percona XtraDB Installation & +-+-+-#
#+-+- Automation script - by histerix -+-+-+#
#############################################
apt update -y
apt install nano net-tools ufw -y
apt remove apparmor -y
wget https://repo.percona.com/apt/percona-release_latest.generic_all.deb
dpkg -i percona-release_latest.generic_all.deb
percona-release setup -y pxc-57
apt install percona-xtradb-cluster-full-57 -y
mv /etc/mysql/percona-xtradb-cluster.conf.d/wsrep.cnf /root/wsrep-cnf-backup.cnf
touch /etc/mysql/percona-xtradb-cluster.conf.d/wsrep.cnf
cat << EOF > /etc/mysql/percona-xtradb-cluster.conf.d/wsrep.cnf
[mysqld]
wsrep_provider=/usr/lib/galera3/libgalera_smm.so
#wsrep_cluster_address=gcomm://10.0.0.1,10.0.0.2,10.0.0.3
wsrep_cluster_address=gcomm://
binlog_format=ROW
default_storage_engine=InnoDB
wsrep_slave_threads=8
innodb_autoinc_lock_mode=2
wsrep_node_address=10.0.0.1
wsrep_node_name=node1
wsrep_cluster_name=pxc-cluster
pxc_strict_mode=ENFORCING
wsrep_sst_method=xtrabackup-v2
wsrep_sst_auth="sstuser:sstpassword"
EOF
ufw -y enable 
ufw default deny incoming
ufw allow from your-ip-here to any port 22
ufw allow from 10.0.0.1 to any port 3306
ufw allow from 10.0.0.1 to any port 4444
ufw allow from 10.0.0.1 to any port 4567
ufw allow from 10.0.0.1 to any port 4568
ufw allow from 10.0.0.2 to any port 3306
ufw allow from 10.0.0.2 to any port 4444
ufw allow from 10.0.0.2 to any port 4567
ufw allow from 10.0.0.2 to any port 4568
ufw allow from 10.0.0.3 to any port 3306
ufw allow from 10.0.0.3 to any port 4444
ufw allow from 10.0.0.3 to any port 4567
ufw allow from 10.0.0.3 to any port 4568
ufw reload
###############################################
#  On next 2 cluster nodes uncomment row 18,  #
#  adjust IP addresses, then comment row 19,  #
# & change addresses & names on rows 24 & 25. #
# Add sstuser now, before running this on 2&3 #
###############################################
