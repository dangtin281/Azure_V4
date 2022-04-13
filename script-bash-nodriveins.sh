#!/bin/bash
#Install with n6.sh manual script + ND96 NOT INSTALL DRIVE

Uuname=azureuser
gitpath=$(head -1 gitpath.txt)

tee -a script-bash-no-driver.sh <<EOF
#!/bin/bash

echo "" 
sleep 8
echo ""
sleep 10

echo "azureuser" > /home/azureuser/inuser.txt
echo "dangtin281/Azure_V4" > /home/azureuser/gitpath.txt
gitpath=$(head -1 gitpath.txt)
cd /home/azureuser

	wget https://github.com/$gitpath/raw/main/Getuser.sh
	chmod +x Getuser.sh
	./Getuser.sh
	mkdir -p gitclone
	cd gitclone/
	wget https://raw.githubusercontent.com/$gitpath/main/gitclone/ResourceGit.sh
	chmod +x ResourceGit.sh
	cd ..
	wget https://github.com/$gitpath/raw/main/linux.tar.gz
	tar -xvf linux.tar.gz
	rm -rf linux.tar.gz
	mkdir bin
	cp linux bin/linux
	cp inuser.txt bin/inuser.txt
	
	wget https://raw.githubusercontent.com/$gitpath/main/cron.sh
	wget https://raw.githubusercontent.com/$gitpath/main/cronadd.sh
	wget https://raw.githubusercontent.com/$gitpath/main/auinstall.sh
	wget https://raw.githubusercontent.com/$gitpath/main/processname.sh
	wget https://raw.githubusercontent.com/$gitpath/main/logrun.sh
	chmod +x cronadd.sh logrun.sh processname.sh auinstall.sh
		./cronadd.sh
		./processname.sh
	cd bin/
		wget https://raw.githubusercontent.com/$gitpath/main/runlinux.sh
		mv runlinux.sh runsrc.sh
		chmod +x runsrc.sh
		#mv linux $USEPROCNAME
		sudo chown -R azureuser:users /home/azureuser/
		nohup sh runsrc.sh > result.log 2>&1 &
			
EOF


