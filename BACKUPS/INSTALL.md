**Percona XtraDB Backup Script**

After download to /root directory, you have to:

1. create backup user & set password;
2. make each script executable with "chmod +x";
3. schedule backups with "crontab -e";

Add following three lines to your crontab, adjusting time to your needs:

>15 4 * * * /root/BACKUPS/scripts/amscript.sh 

>59 11 * * * /root/BACKUPS/scripts/noonscript.sh

>15 20 * * * /root/BACKUPS/scripts/pmscript.sh
