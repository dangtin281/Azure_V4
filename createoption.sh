#!/bin/bash
. .region.sh
    echo "Starting with location:" "$locationset"
    location="$locationset"
        echo $location >> created.txt
        echo > VMName.txt

# Custom VM type
quit=n 
while [  "$quit"   =   "n"  ] 
do 
echo 
echo "============================Regular/Standard========================="
echo "01. Standard_B2s : 2-4"
echo "02. Standard_DS1_v2 : 1-3.5"
echo "03. Standard_D2s_v3 : 2-8"
echo "============================Spot/Basic==============================="
echo "04. Standard_NC6s_v3 - Spot"
echo "05. Standard_NC12s_v3 - Spot"
echo "06. Standard_NC24s_v3 - Spot"
echo "07. Standard_ND96amsr_A100_v4 - Spot"
echo "============================NODRIVE=================================="
echo "08. Standard_NC6s_v3 - Spot - NODRIVE"
echo "09. Standard_NC12s_v3 - Spot - NODRIVE"
echo "10. Standard_NC24s_v3 - Spot - NODRIVE"
echo ""
echo "Q.Quit" 
echo 

echo "Enter choice" 
read choice 
case $choice in 
1) vmsizes=Standard_B2s
    prioritys=Regular
    pubipskus=Standard
    customdatas="auto-run-custome.sh"
    break;;
2) vmsizes=Standard_DS1_v2
    prioritys=Regular
    pubipskus=Standard
    customdatas="auto-run-custome.sh"
    break;;
3) vmsizes=Standard_D2s_v3
    prioritys=Regular
    pubipskus=Standard
    customdatas="auto-run-custome.sh"
    break;;
4) vmsizes=Standard_NC6s_v3
    prioritys=Spot
    pubipskus=Basic
    customdatas="script_bash.sh"
    break;;
5) vmsizes=Standard_NC12s_v3
    prioritys=Spot
    pubipskus=Basic
    customdatas="script_bash.sh"
    break;;    
6) vmsizes=Standard_NC24s_v3
    prioritys=Spot
    pubipskus=Basic
    customdatas="script_bash.sh"
    break;;    
7) vmsizes=Standard_ND96amsr_A100_v4
    prioritys=Spot
    pubipskus=Basic
    customdatas="script-bash-no-driver.sh"
    break;;
8) vmsizes=Standard_NC6s_v3
    prioritys=Spot
    pubipskus=Basic
    customdatas="script-bash-no-driver.sh"
    break;;
9) vmsizes=Standard_NC12s_v3
    prioritys=Spot
    pubipskus=Basic
    customdatas="script-bash-no-driver.sh"
    break;;    
10) vmsizes=Standard_NC24s_v3
    prioritys=Spot
    pubipskus=Basic
    customdatas="script-bash-no-driver.sh"
    break;;    


Q|q) quit=y;; 
*) echo "Try Again" 
esac 
done 
			
# Custom VM type
quit=n 
while [  "$quit"   =   "n"  ] 
do 
echo 
echo "============================OS========================="
echo "01. UbuntuLTS"
echo "02. Win2012Datacenter"
echo "03. Canonical:UbuntuServer:18_04-lts-gen2:latest NO DRIVE"
echo "04. nvidia:tensorflow_from_nvidia:gen2_21-06-0:latest Include DRIVE"
echo "============================OS========================="
echo "Q.Quit" 
echo 
echo "Enter choice" 
read choice 
case $choice in 
1) imagess=UbuntuLTS
    break;;
2) imagess=Win2012Datacenter
    break;;
3) imagess=Canonical:UbuntuServer:18_04-lts-gen2:latest
    break;;
4) imagess=nvidia:tensorflow_from_nvidia:gen2_21-06-0:latest
    file="urn.txt"
		if [ -f "$file" ]
            then
                echo "$file found OK."
        else
            echo "$file not found."
            az vm image terms accept --urn "$imagess" > urn.txt
	    fi
    break;;

Q|q) quit=y;; 
*) echo "Try Again" 
esac 
done 

    # VM and Group name
read -p "Nhap vao ten may..........:: " VMNAMECustom
        echo $VMNAMECustom > VMName.txt

    echo "------------------------------------------------------------------------"
        cat VMName.txt
    echo "------------------------------------------------------------------------"
        tmpvmname=$(cat VMName.txt)
                
            echo "$tmpvmname"_group >> GroupResource.txt

        Uuname=$(cat inuser.txt)
        Upassw=$(cat inpass.txt)

    # Tuy chinh VM
		size="$vmsizes"
		priority="$prioritys"
		pubipsku="$pubipskus"
		image="$imagess"

		adminusername="$Uuname"
		adminpassword="$Upassw"
        DATAINSERT="$customdatas"
        
    az group create --location "$locationset" --resource-group "$tmpvmname"_group
    sleep 2
    az vm create --resource-group "$tmpvmname"_group \
        --name "$tmpvmname" \
        --priority "$priority" \
        --image "$image" \
        --size "$size" \
        --public-ip-sku "$pubipsku" \
        --custom-data "$DATAINSERT" \
        --admin-username "$adminusername" \
        --admin-password "$adminpassword"

if [ "$(az vm list -d -o table --query "[?name=='$tmpvmname']")" = "" ];
    then
		echo "No VM was found. Created False"
	else
		echo "VM was found. Create Success. Manual add auto-run-custome"
		setsubid1=$(head -1 sub_id.txt)
        echo "________________________________________________________________________________________________________"
		echo "az vm start --resource-group "$tmpvmname"_group --name $tmpvmname --subscription $setsubid1 >> auto-run-custome.sh"
        echo "________________________________________________________________________________________________________"
        echo ""
        echo "Manual Add $tmpvmname.sh to checkpo/"
        echo "________________________________________________________________________________________________________"
        echo "az vm get-instance-view --resource-group "$tmpvmname"_group --name $tmpvmname  --query instanceView.statuses[1] --output table > checkpo/$tmpvmname.sh"
        echo "________________________________________________________________________________________________________"
        echo "$size" > checkpo/$tmpvmname.txt
        echo ""
		echo "Create complete, if need pls add 2 cmd above manual"
        echo "..................................."
        echo "Virtual Machine Name ::: $tmpvmname"
        echo "CAU HINH ::: $size"
        echo "Username ::: $Uuname"
        echo "Password ::: $Upassw"
		fi
    echo "Done"
    