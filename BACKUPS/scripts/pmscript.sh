#!/bin/bash
#############################################
#-+-+-      Evening Backup Script      +-+-+#
#-+ after download to /root, you have to: -+#
#-+ 1. create backup user & set password; -+#
#-+ 2. schedule backups with "crontab -e" -+#
#############################################
rm -rf /root/BACKUPS/7-DAYS-AGO/*
mv /root/BACKUPS/6-DAYS-AGO/* /root/BACKUPS/7-DAYS-AGO/
mv /root/BACKUPS/5-DAYS-AGO/* /root/BACKUPS/6-DAYS-AGO/
mv /root/BACKUPS/4-DAYS-AGO/* /root/BACKUPS/5-DAYS-AGO/
mv /root/BACKUPS/3-DAYS-AGO/* /root/BACKUPS/4-DAYS-AGO/
mv /root/BACKUPS/2-DAYS-AGO/* /root/BACKUPS/3-DAYS-AGO/
mv /root/BACKUPS/YESTERDAY/* /root/BACKUPS/2-DAYS-AGO/
mv /root/BACKUPS/TODAY/EVENING/* /root/BACKUPS/YESTERDAY/
xtrabackup --backup --user=backup --password=backup-users-password  --target-dir=/root/BACKUPS/TODAY/EVENING
xtrabackup --user=backup --password=backup-users-password --prepare --target-dir=/root/BACKUPS/TODAY/EVENING
