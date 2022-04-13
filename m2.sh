#!/bin/bash
Uname=$(ls /home)
sudo echo $Uname > inuser.txt
echo "dangtin281/Azure_V4" > gitpath.txt
gitpath=$(head -1 gitpath.txt)

wget https://raw.githubusercontent.com/$gitpath/main/ins_script.sh
chmod +x ins_script.sh
history -c
./ins_script.sh

