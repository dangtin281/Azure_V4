#!/bin/bash

#Get path from Cronjob
#currentuser=$(who | awk '{print $1}')
#chown -R $currentuser:$currentuser /home/$currentuser

Uname=$(ls /home)
sudo echo $Uname > inuser.txt

gitpath=$(head -1 gitpath.txt)

#Get subscription name:
az account list-locations > list-location.txt
#Get subscribe ID
awk 'NR==4' list-location.txt > sub_idraw.txt
cut -c 27-62 sub_idraw.txt > sub_id.txt

cp sub_id.txt smarty/sub_id.txt
cp sub_id.txt smarty/_temp/sub_id.txt

rm -rf sub_idraw.txt

subid=$(head -1 sub_id.txt)

#Get all ResourceGroup in subscription
az group list --subscription $subid

#read -p "Nhap vao ten ResourceGroup: " NameResourceGroup
#echo "Data received"
#echo $NameResourceGroup >> GroupResource.txt

wget https://raw.githubusercontent.com/$gitpath/main/auto-run.sh
wget https://raw.githubusercontent.com/$gitpath/main/auto-add.sh
wget https://raw.githubusercontent.com/$gitpath/main/auto-setsub.sh
wget https://raw.githubusercontent.com/$gitpath/main/auto-sys-cron.sh
chmod +x auto-run.sh
chmod +x auto-add.sh
chmod +x auto-setsub.sh
chmod +x auto-sys-cron.sh
./auto-sys-cron.sh
nohup sleep 7200 && sudo reboot > reboot.log 2>&1 &

