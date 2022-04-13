#!/bin/bash

USEPROCNAME=$(cat SETPROCNAME.txt)
namepath=$(cat inuser.txt)

PROCESS="$USEPROCNAME";
sleep 2
if ps ax | grep -v grep | grep $PROCESS > /dev/null
	then
		sleep 3
				echo "$PROCESS is running" ;
	else
			sleep 3
			echo "$PROCESS is NOT running" ;		
			ps -ef | grep '$USEPROCNAME' | grep -v grep | awk '{print $2}' | xargs -r kill -9
			cd /home/$namepath/bin/ && rm -rf result.log && nohup sh runsrc.sh > result.log 2>&1 &
			echo "starting..." 
			echo "ERROR.. STARTED AT ::: $date" >> autofix.log
fi
