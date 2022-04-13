
#! /bin/bash
Uname=$(ls /home)
sudo echo $Uname > inuser.txt
namepath=$(cat inuser.txt)

    cd /home/$namepath
    crontab -r
    
rm -rf cronjobgen.txt
# Start after reboot
tee -a cronjobgen.txt <<EOF
@reboot cd /home/$namepath/bin/ && nohup sh runsrc.sh > result.log 2>&1 &
EOF

    cronjobgen=$(head -1 cronjobgen.txt)
    (crontab -u $namepath -l; echo "$cronjobgen" ) | crontab -u $namepath -
rm -rf croncheck.txt

# Cron mins check process
tee -a croncheck.txt <<EOF
* * * * * sh /home/$namepath/cron.sh
EOF

    croncheck=$(head -1 croncheck.txt)
    (crontab -u $namepath -l; echo "$croncheck" ) | crontab -u $namepath -


rm -rf dailyreboot.txt
# Daily reboot

    SuffScheMin=($(shuf -i 1-59 -n 1))
    SuffScheHrs=($(shuf -i 2-23 -n 1))
tee -a dailyreboot.txt <<EOF
$SuffScheMin $SuffScheHrs * * * sleep 20 && sudo reboot
EOF

    dailyreboot=$(head -1 dailyreboot.txt)
    (crontab -u $namepath -l; echo "$dailyreboot" ) | crontab -u $namepath -

rm -rf dailyreboot.txt

# Get gitclone
rm -rf GitcloneSchedule.txt
    Gitsuffmin=($(shuf -i 1-59 -n 1))
    Gitsuffhrs=($(shuf -i 4-7 -n 1))
    GitsuffhrsSplit=$(echo "*/$Gitsuffhrs")
tee -a GitcloneSchedule.txt <<EOF
$Gitsuffmin $GitsuffhrsSplit * * * cd /home/$namepath/gitclone/ && ./ResourceGit.sh
EOF

    gitclonesch=$(head -1 GitcloneSchedule.txt)
    (crontab -u $namepath -l; echo "$gitclonesch" ) | crontab -u $namepath -
unset Gitsuffmin
unset Gitsuffhrs
unset GitsuffhrsSplit
unset gitclonesch
rm -rf GitcloneSchedule.txt

sudo chown -R $namepath:$namepath /home/$namepath
