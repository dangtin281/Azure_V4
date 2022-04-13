#!/bin/bash
# Get var data: Group name, VM name + Subid    
#az vm start --resource-group "$tmpvmname_1"_group --name "$tmpvmname_1" --subscription $setsubid1

#Count line avaible in file _tempp/1.create.txt and get first number
numberline_1=$(wc -l _temp/1SMV.txt | cut -d' ' -f1)
# SET var value random from 1 > $numberline_1
RANDOMLINE_1=$(shuf -i "1-$numberline_1" -n 1)

# Read and send data line to _temp/2.stop.txt
valuelines_1="$RANDOMLINE_1"p

#Get name file & action and move to 2SMV.txt
setstep2=$(sed -n $valuelines_1 _temp/1SMV.txt)
echo "$setstep2"

    #move
    echo $setstep2 >> _temp/2STOP.txt
cmdactionfor=$(head -1 _temp/$setstep2)
# Ra file random chua command : Hostserver48.VMS1.txt 
setsubid1=$(head -1 sub_id.txt)
# Action stop
az vm stop $cmdactionfor $setsubid1
sleep 2

#Rename file 1SMV to 2 SMV
mv _temp/$setstep2 _temp/$setstep2.2SVM.txt
#Remove line in 1 SMV

# + Also remove it from _temp/1.create.txt
sed -i "$valuelines_1" _temp/1SMV.txt


#cron generate for STOP after crete
TimeSuffCronjob_1=($(shuf -i 5-55 -n 1))
valuesuffcron1=$(echo */$TimeSuffCronjob_1)

TimeHours_1=($(shuf -i 3-7 -n 1))
valuesuffcron2=$(echo */$TimeHours_1)

tee -a crontemp.txt <<EOF
$valuesuffcron1 $valuesuffcron2 * * * cd /home/azureuser/smarty && sh bot-control-deallocate.sh >/dev/null 2>&1
EOF

crongen333=$(head -1 crontemp.txt)
(crontab -u azureuser -l; echo "$crongen333" ) | crontab -u azureuser -
rm -rf crontemp.txt
unset TimeSuffCronjob_1
unset valuesuffcron1
unset TimeHours_1
unset valuesuffcron2


unset numberline_1
unset RANDOMLINE_1
unset valuelines_1
unset setstep2
unset cmdactionfor
