#!/bin/bash

file=list_region_createvm_use.txt

while IFS= read -r locationset
    do

        TimeSleepCreateWait=($(shuf -i 30-90 -n 1))
            sleep $TimeSleepCreateWait

        echo "$locationset"
        location="$locationset"
        echo $location >> created.txt
         echo > VMName.txt
    . .lstword.sh
        echo $WORDTOUSE$RANDOMNumbers > VMName.txt
        cat VMName.txt
        tmpvmname=$(cat VMName.txt)
            echo $tmpvmname
                GRSNAMESUB=(
                    "Group"
                    "group"
                    "Gr"
                    "gr"
                    "vmgroup"
                    "lib"
                    "Resoucegroup"
                    "rg"
                    "zone"
                    "instance"
                    "catalog"
                    "standart")
            echo "$tmpvmname"_"$GRSNAMESUB" >> GroupResource.txt
        Uuname=$(cat inuser.txt)
        Upassw=$(cat inpass.txt)

    size=Standard_NC6s_v3
    priority=Spot
    pubipsku=Basic
    adminusername=$Uuname
    adminpassword=$Upassw

    az group create --location $locationset --resource-group "$tmpvmname"_"$GRSNAMESUB"

    DOI1TI=($(shuf -i 2-6 -n 1))
    sleep $DOI1TI

    az vm create --resource-group "$tmpvmname"_group --name $tmpvmname --priority $priority --image UbuntuLTS --size $size --public-ip-sku $pubipsku --custom-data script-bash.sh --admin-username $adminusername --admin-password $adminpassword

        if [ "$(az vm list -d -o table --query "[?name=='$tmpvmname']")" = "" ];
		    then
			    echo "No VM was found. Created False"
		    else
			    echo "VM was found. Create Success. Adding to auto-run-custome"
				setsubid1=$(head -1 sub_id.txt)
				echo "az vm start --resource-group "$tmpvmname"_group --name $tmpvmname --subscription $setsubid1" >> auto-run-custome.sh
				echo "Added done"
                echo "..................................."
                echo "DA TAO Virtual Machine ::: $tmpvmname"
                echo "CAU HINH ::: $size"
                echo "Username ::: $Uuname"
                echo "Password ::: $Upassw"
                echo "..................................."
		fi
    
done < "$file"

