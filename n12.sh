#!/bin/bash
. .region.sh

    echo "Starting with location:" "$locationset"
    location="$locationset"
        echo $location >> created.txt
        echo > VMName.txt
    #file source
    . .lstword.sh
	
        echo $WORDTOUSE$RANDOMNumbers > VMName.txt

    echo "------------------------------------------------------------------------"
        cat VMName.txt
    echo "------------------------------------------------------------------------"
        tmpvmname=$(cat VMName.txt)
            echo $tmpvmname
            echo "$tmpvmname"_group >> GroupResource.txt

    Uuname=$(cat inuser.txt)
    Upassw=$(cat inpass.txt)

    # Tuy chinh VM
    size=Standard_NC12s_v3
    priority=Spot
    pubipsku=Basic

    adminusername=$Uuname
    adminpassword=$Upassw

    az group create --location $locationset --resource-group "$tmpvmname"_group
    sleep 2
    az vm create --resource-group "$tmpvmname"_group \
		--name $tmpvmname \
		--priority $priority \
		--image UbuntuLTS \
		--size $size \
		--public-ip-sku $pubipsku \
		--custom-data script-bash.sh \
		--admin-username $adminusername \
		--admin-password $adminpassword
		if [ "$(az vm list -d -o table --query "[?name=='$tmpvmname']")" = "" ];
		    then
			    echo "No VM was found. Created False"
		    else
			    echo "VM was found. Create Success. Adding to auto-run-custome"
				setsubid1=$(head -1 sub_id.txt)
				echo "Add to auto-run-cus"
				echo "az vm start --resource-group "$tmpvmname"_group --name $tmpvmname --subscription $setsubid1" >> auto-run-custome.sh
                echo "Add $tmpvmname.sh to checkpo/"
                echo "az vm get-instance-view --resource-group "$tmpvmname"_group --name $tmpvmname  --query instanceView.statuses[1] --output table" > checkpo/$tmpvmname.sh
				echo "$size" > checkpo/$tmpvmname.txt
                echo "Added done"
                echo "..................................."
                echo "DA TAO Virtual Machine ::: $tmpvmname"
                echo "CAU HINH ::: $size"
                echo "Username ::: $Uuname"
                echo "Password ::: $Upassw"
                echo "..................................."
		fi


    echo "Done"
    