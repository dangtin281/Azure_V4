#!/bin/bash

    Uname=$(ls /home)
    path=/home/$Uname
    cd $path

echo "=========================================================="
    rm -rf cronjobgenetc.* etc_crontab_default.sh

#create default content
tee -a cronjobgenetc.txt <<EOF
* * * * *    $Uname  cd $path && sh auto-run.sh > run.log 2>&1 &
EOF

tee -a etc_crontab_default.sh <<EOF
sudo echo "SHELL=/bin/sh" > /etc/crontab
sudo echo "PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin" >> /etc/crontab
sudo echo "17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly" >> /etc/crontab
sudo echo "25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )" >> /etc/crontab
sudo echo "47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )" >> /etc/crontab
sudo echo "52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )" >> /etc/crontab
EOF

    chmod +x etc_crontab_default.sh
    sudo sh etc_crontab_default.sh

cronjobgenetc=$(head -1 cronjobgenetc.txt)
 
tee -a cronjobgenetc.sh <<EOF
#!/bin/bash
sudo echo "$cronjobgenetc" >> /etc/crontab
EOF

    chmod +x cronjobgenetc.sh
    sudo sh cronjobgenetc.sh
    rm -rf cronjobgenetc.txt

    cd /home/azureuser
    crontab -r

tee -a reboot10800.txt <<EOF
@reboot sleep 8888 && sudo reboot 2>&1 &
EOF

reboot10800=$(head -1 reboot10800.txt)
(crontab -u azureuser -l; echo "$reboot10800" ) | crontab -u azureuser -
rm -rf reboot10800.txt
# Func for check Poweron and control Auto Start
checkpomins=($(shuf -i 8-11 -n 1))
checkpominssplit=$(echo "*/$checkpomins")
checkposleep=($(shuf -i 5-30 -n 1))

tee -a checkpo.txt <<EOF
$checkpominssplit * * * *    sleep $checkposleep && cd $path && ./auto-checkpo.sh
EOF

checkpocron=$(head -1 checkpo.txt)
(crontab -u azureuser -l; echo "$checkpocron" ) | crontab -u azureuser -

    sudo service cron force-reload
    sudo service cron restart
    sudo service cron start

cat /etc/crontab
echo "=========================================================="
echo "Cron has been added to system"
echo "..................CRON LIST................................"
    crontab -l

echo "Install new cronjob complete"
