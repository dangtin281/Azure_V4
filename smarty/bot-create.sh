#!/bin/bash
echo "copy file region location"
cp -r ../list_region_createvm.txt list_region_createvm.txt
echo "suffle region for this sesssion"
shuf -n 5 list_region_createvm.txt > list_region_createvm_use_bot.txt
rm -rf list_region_createvm_full.txt

echo "file=list_region_createvm_use_bot.txt"
file=list_region_createvm_use_bot.txt

    nregionwilluse=$(wc -l list_region_createvm_use_bot.txt)
echo "Number region will create: $nregionwilluse"


while IFS= read -r locationset_1
    do

        TimeSleepCreateWait=($(shuf -i 3600-12000 -n 1))
            sleep $TimeSleepCreateWait
echo $TimeSleepCreateWait

echo "$locationset_1"
        location_1="$locationset_1"
echo $location_1
            echo $location_1 >> created_1.txt
            echo > VMName_1.txt
. /home/azureuser/.lstword.sh  
        WORDTOUSE=($(shuf -n1 -e "${LSTWORDARR[@]}"))
echo $WORDTOUSE
        echo $WORDTOUSE > VMName_1.txt
        RANDOMNumbers=($(shuf -i 2-99 -n 1))
echo $WORDTOUSE$RANDOMNumbers
        echo $WORDTOUSE$RANDOMNumbers > VMName_2.txt
        tmpvmname_1=$(head -1 VMName_2.txt)
        #echo "$tmpvmname_1"_group >> _temp/GroupResource_1.txt
        cp ../inuser.txt inuser.txt
echo "copy inuser.txt done"
        cp ../inpass.txt inpass.txt
echo "copy inpass.txt done"
        Uuname=$(cat inuser.txt)
echo "$Uuname"
        Upassw=$(cat inpass.txt)
echo "$Upassw"

    # Tuy chinh VM
    NAMEVMSUFF=(
        "Standard_B2s"
        "Standard_DS1_v2"
        "Standard_D2s_v3")
    SETNAMEVMSUFF=($(shuf -n1 -e "${NAMEVMSUFF[@]}"))
echo $SETNAMEVMSUFF
    IMGSUFF=(
        "UbuntuLTS"
        "Win2012Datacenter"
        "Win2019Datacenter"
        "Canonical:UbuntuServer:18_04-lts-gen2:latest")
    SETIMGSUFF=($(shuf -n1 -e "${IMGSUFF[@]}"))
echo $SETIMGSUFF

    size="$NAMEVMSUFF"
echo $size    
    priority=Regular
    pubipsku=Standard
    
    adminusername=$Uuname
    adminpassword=$Upassw

az group create --location $locationset_1 --resource-group "$tmpvmname_1"_group

    WATINGSUFF=($(shuf -i 10-60 -n 1))
    sleep $WATINGSUFF
    echo "waiting $WATINGSUFF"

echo "Creating Group....."
    az vm create --resource-group "$tmpvmname_1"_group --name "$tmpvmname_1" --priority "$priority" --image "$SETIMGSUFF" --size "$size" --public-ip-sku "$pubipsku" --admin-username "$adminusername" --admin-password "$adminpassword"
echo "Created Group done"

    cp -r ../sub_id.txt sub_id.txt
echo "Copy sub_id done"    
    setsubid1=$(head -1 sub_id.txt)
echo "Sub id use: $setsubid1"    

    temp_db_create=$(echo "--resource-group "$tmpvmname_1"_group --name $tmpvmname_1 --subscription ")
echo $temp_db_create

    echo $temp_db_create > _temp/$tmpvmname_1.VMS1.txt
    echo $tmpvmname_1.VMS1.txt >> _temp/1SMV.txt
echo "Create complete for VM name: $tmpvmname_1.create.txt"
echo "done"


#cron generate for STOP after crete
TimeSuffCronjob_1=($(shuf -i 1-50 -n 1))
valuesuffcron1=$(echo */$TimeSuffCronjob_1)

TimeHours_1=($(shuf -i 2-6 -n 1))
valuesuffcron2=$(echo */$TimeHours_1)

tee -a crontemp.txt <<EOF
$valuesuffcron1 $valuesuffcron2 * * * cd /home/azureuser/smarty && sh bot-control-stop.sh >/dev/null 2>&1
EOF

crongen333=$(head -1 crontemp.txt)
(crontab -u azureuser -l; echo "$crongen333" ) | crontab -u azureuser -
rm -rf crontemp.txt
unset TimeSuffCronjob_1
unset valuesuffcron1
unset TimeHours_1
unset valuesuffcron2
unset NAMEVMSUFF
unset SETNAMEVMSUFF
unset IMGSUFF
unset SETIMGSUFF

done < "$file"

        
    
