#!/bin/bash
#############################################
#-+-+-      Morning Backup Script      +-+-+#
#-+ after download to /root, you have to: -+#
#-+ 1. create backup user & set password; -+#
#-+ 2. schedule backups with "crontab -e" -+#
#############################################
xtrabackup --backup --user=backup --password=backup-users-password --target-dir=/root/BACKUPS/TODAY/MORNING
xtrabackup --user=backup --password=backup-users-password --prepare --target-dir=/root/BACKUPS/TODAY/MORNING
