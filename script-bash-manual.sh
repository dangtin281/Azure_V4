#!/bin/bash

# File danh cho copy dan vao SSH de cai
Uname=$(ls /home)
namepath=$(cat name.txt)
path=/home/$namepath

echo > "dangtin281/Azure_V4" > gitpath.txt
cp gitpath.txt /home/azureuser/gitpath.txt

gitpath=$(head -1 gitpath.txt)

cd /home/$Uname
echo "$Uname" > /home/$Uname/inuser.txt
Uname=$(cat /home/$Uname/inuser.txt)

wget https://raw.githubusercontent.com/$gitpath/main/m1.sh
    cp m1.sh /home/$Uname/m1.sh && chmod +x /home/$Uname/m1.sh

wget https://raw.githubusercontent.com/$gitpath/main/auinstall.sh
    cp auinstall.sh /home/$Uname/auinstall.sh && chmod +x /home/$Uname/auinstall.sh

    echo "installing" > /home/$Uname/install.txt

(crontab -u $Uname -l; echo "@reboot sh /home/$Uname/auinstall.sh 2>&1 &" ) | crontab -u $Uuname -
sudo chown -R $Uname:$Uname /home/$Uname/
cd /home/$Uname/
    ./m1.sh
    rm -rf /home/$Uname/install.lock

echo "Install Completed" > /home/$Uname/installed.lock

sudo chown -R $Uname:$Uname /home/$Uname/
