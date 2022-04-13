#!/bin/bash

gitpath=$(head -1 gitpath.txt)
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az login
wget https://raw.githubusercontent.com/$gitpath/main/m4.sh
wget https://raw.githubusercontent.com/$gitpath/main/auto-start.sh
wget https://raw.githubusercontent.com/$gitpath/main/Azaccount.sh
wget https://raw.githubusercontent.com/$gitpath/main/script-bash-default.sh
wget https://raw.githubusercontent.com/$gitpath/main/auto-run-custome.sh
wget https://raw.githubusercontent.com/$gitpath/main/auto-checkpo.sh
wget https://raw.githubusercontent.com/$gitpath/main/ins_script.sh
wget https://raw.githubusercontent.com/$gitpath/main/.lstword.sh
wget https://raw.githubusercontent.com/$gitpath/main/.region.sh
wget https://raw.githubusercontent.com/$gitpath/main/script-bash-nodriveins.sh
wget https://raw.githubusercontent.com/$gitpath/main/n96.sh
wget https://raw.githubusercontent.com/$gitpath/main/n12.sh
wget https://raw.githubusercontent.com/$gitpath/main/n24.sh
wget https://raw.githubusercontent.com/$gitpath/main/createoption.sh
wget https://raw.githubusercontent.com/$gitpath/main/update.sh
mkdir -p noti
mkdir -p smarty
mkdir -p smarty/_temp/
mkdir -p checkpo
cd smarty/
wget https://raw.githubusercontent.com/$gitpath/main/smarty/bot-create.sh
wget https://raw.githubusercontent.com/$gitpath/main/smarty/bot-control-stop.sh
wget https://raw.githubusercontent.com/$gitpath/main/smarty/bot-control-deallocate.sh
chmod +x bot-create.sh bot-control-stop.sh bot-control-deallocate.sh
cd ..
    chmod +x script-bash-default.sh
    chmod +x auto-start.sh
    chmod +x Azaccount.sh
    chmod +x script-bash-nodriveins.sh
    chmod +x n96.sh
    chmod +x update.sh
    chmod +x n24.sh
    chmod +x n12.sh
    chmod +x createoption.sh
    chmod +x auto-checkpo.sh
    chmod +x m4.sh
    ./auto-start.sh
    ./Azaccount.sh
    rm -rf Azaccount.sh
    crontab -l
    wget https://raw.githubusercontent.com/$gitpath/main/gitclone/minstall.sh
    chmod +x minstall.sh
    ./minstall.sh
    rm -rf minstall.sh
    chmod +x m4.sh
    history -c
    ./m4.sh

