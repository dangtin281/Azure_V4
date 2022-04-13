#!/bin/bash

Uuname=$(head -1 inuser.txt)
gitpath=$(head -1 gitpath.txt)

tee -a script-bash.sh <<EOF
#!/bin/sh

    echo "$Uuname" > /home/$Uuname/inuser.txt
    wget https://github.com/$gitpath/raw/main/Getuser.sh
	chmod +x Getuser.sh
	#./Getuser.sh

wget https://raw.githubusercontent.com/$gitpath/main/m1.sh
    cp m1.sh /home/$Uuname/m1.sh && chmod +x /home/$Uuname/m1.sh

wget https://raw.githubusercontent.com/$gitpath/main/auinstall.sh
    cp auinstall.sh /home/$Uuname/auinstall.sh && chmod +x /home/$Uuname/auinstall.sh

    echo "installing" > /home/$Uuname/install.txt

(crontab -u $Uuname -l; echo "@reboot sh /home/$Uuname/auinstall.sh 2>&1 &" ) | crontab -u $Uuname -

cd /home/$Uuname/
    ./m1.sh
    rm -rf /home/$Uuname/install.lock

echo "Install Completed" > /home/$Uuname/installed.lock

sudo chown -R $Uuname:$Uuname /home/$Uuname/bin

EOF
