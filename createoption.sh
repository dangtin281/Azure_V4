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
echo "============================NCA10 ADS================================"
echo "11. Standard_NC8ads_A10_v4 - Spot - NODRIVE"
echo "12. Standard_NC16ads_A10_v4 - Spot - NODRIVE"
echo "13. Standard_NC32ads_A10_v4 - Spot - NODRIVE"
echo "============================NCT4-ads================================="
echo "14. Standard_NC16as_T4_v3 - Spot - NODRIVE"
echo "15. Standard_NC64as_T4_v3 - Spot - NODRIVE"
echo "99. CUSTOM SIZE"

echo ""
echo "Q.Quit" 
echo 

echo "Enter choice" 
read choice 
case $choice in 
1) vmsizes=Standard_B2s
    prioritys=Regular
    pubipskus=Standard
    break;;
2) vmsizes=Standard_DS1_v2
    prioritys=Regular
    pubipskus=Standard
    break;;
3) vmsizes=Standard_D2s_v3
    prioritys=Regular
    pubipskus=Standard
    break;;
4) vmsizes=Standard_NC6s_v3
    prioritys=Spot
    pubipskus=Basic
    break;;
5) vmsizes=Standard_NC12s_v3
    prioritys=Spot
    pubipskus=Basic
    break;;    
6) vmsizes=Standard_NC24s_v3
    prioritys=Spot
    pubipskus=Basic
    break;;    
7) vmsizes=Standard_ND96amsr_A100_v4
    prioritys=Spot
    pubipskus=Basic
    break;;
8) vmsizes=Standard_NC6s_v3
    prioritys=Spot
    pubipskus=Basic
    break;;
9) vmsizes=Standard_NC12s_v3
    prioritys=Spot
    pubipskus=Basic
    break;;    
10) vmsizes=Standard_NC24s_v3
    prioritys=Spot
    pubipskus=Basic
    break;;    
11) vmsizes=Standard_NC8ads_A10_v4
    prioritys=Spot
    pubipskus=Basic
    break;;
12) vmsizes=Standard_NC16ads_A10_v4
    prioritys=Spot
    pubipskus=Basic
    break;;    
13) vmsizes=Standard_NC32ads_A10_v4
    prioritys=Spot
    pubipskus=Basic
    break;;   
14) vmsizes=Standard_NC16as_T4_v3
    prioritys=Spot
    pubipskus=Basic
    break;;       
15) vmsizes=Standard_NC64as_T4_v3
    prioritys=Spot
    pubipskus=Basic
    break;;       
19) unset sizes_cus
	read -p "Nhap vao ten SIZE: " sizes_cus
	echo "Data received"
	echo $sizes_cus
	vmsizes=$sizes_cus
    break;;	

Q|q) quit=y;; 
*) echo "Try Again" 
esac 
done 

Uuname=$(cat inuser.txt)
adminusername="$Uuname"

quit=n 
while [  "$quit"   =   "n"  ] 
do 
echo 
echo "============================OS========================="
echo "01. UbuntuServer:18_04-lts-gen2"
echo "02. Win2012Datacenter"
echo "03. Canonical:UbuntuServer:18_04-lts-gen2:latest NO DRIVE"
echo "04. nvidia:tensorflow_from_nvidia:gen2_21-06-0:latest DRIVE"
echo "05. nvidia:pytorch_from_nvidia:gen2_21-11-0:latest DRIVE"

echo "99. CUSTOM IMAGE"
echo "============================OS========================="
echo "Q.Quit" 
echo 
echo "Enter choice" 
read choice 
case $choice in 
1) imagess=UbuntuLTS
    adminusername="$Uuname"
    customdatas="auto-run-custome.sh"
    break;;
2) imagess=Win2012Datacenter
    adminusername="$Uuname"
    customdatas="auto-run-custome.sh"
    break;;
3) imagess=Canonical:UbuntuServer:18_04-lts-gen2:latest
    adminusername="$Uuname"
    customdatas="script-bash.sh"
    break;;
4) imagess=nvidia:tensorflow_from_nvidia:gen2_21-06-0:latest
    adminusername="azureuser"
    file="urn.txt"
		if [ -f "$file" ]
            then
                echo "$file found OK."
            else
                echo "$file not found."
                az vm image terms accept --urn "$imagess" > urn.txt
	    fi
    customdatas="script-bash-no-driver.sh"
    break;;

5) imagess=nvidia:pytorch_from_nvidia:gen2_21-11-0:latest
    adminusername="azureuser"
    file="urnpy.txt"
		if [ -f "$file" ]
            then
                echo "$file found OK."
            else
                echo "$file not found."
                az vm image terms accept --urn "$imagess" > urnpy.txt
	    fi
    customdatas="script-bash-no-driver.sh"
    break;;

99) unset imagess_cus
	read -p "Nhap vao ten IMAGES: " imagess_cus
	echo "Data received"
	echo $imagess_cus
	imagess=$imagess_cus
    break;;	

Q|q) quit=y;; 
*) echo "Try Again" 
esac 
done 

    # VM and Group name
read -p "Nhap vao ten may..........:: " vmnamecuscreate
        echo "$vmnamecuscreate" > VMName.txt
        tmpvmname="$vmnamecuscreate"
        tmpnamegroup=$(echo "$tmpvmname"_group)
        Uuname=$(cat inuser.txt)
        Upassw=$(cat inpass.txt)
		size="$vmsizes"
		priority="$prioritys"
		pubipsku="$pubipskus"
		image="$imagess"
		adminpassword="$Upassw"
        DATAINSERT="$customdatas"

    az group create --location "$locationset" --resource-group "$tmpnamegroup"
    sleep 2
    . .regionsub.sh
    az vm create --resource-group "$tmpnamegroup" \
        --name "$tmpvmname" \
        --priority "$priority" \
        --image "$image" \
        --size "$size" \
        --location "$vmlocationsub" \
        --public-ip-sku "$pubipsku" \
        --custom-data "$DATAINSERT" \
        --admin-username "$adminusername" \
        --admin-password "$adminpassword"
    
echo -n "Add this VM to AUTO RUN (y/n)? "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    echo Yes
    if [ "$(az vm list -d -o table --query "[?name=='$tmpvmname']")" = "" ];
    then
		echo "No VM was found. Created False"
	else
        RANDOMSleepcreate=($(shuf -i 1-60 -n 1))
		echo "VM was found. Create Success. Manual add auto-run-custome"
		setsubid1=$(head -1 sub_id.txt)
		echo "az vm start --resource-group "$tmpnamegroup" --name $tmpvmname --subscription $setsubid1" >> auto-run-custome.sh
        echo "sleep .$RANDOMSleepcreate" >> auto-run-custome.sh
        echo "$tmpnamegroup" >> GroupResource.txt
        echo "az vm get-instance-view --resource-group "$tmpnamegroup" --name $tmpvmname  --query instanceView.statuses[1] --output table" > checkpo/$tmpvmname.sh
        echo "$size" > checkpo/$tmpvmname.txt
        echo "Virtual Machine Name ::: $tmpvmname"
        echo "Size ::: $size"
        echo "UN ::: $Uuname"
        echo "PD ::: $Upassw"
		fi
    echo "Done"
else
    echo No
        echo "Create complete"
        echo "Virtual Machine Name ::: $tmpvmname"
        echo "Size ::: $size"
        echo "UN ::: $Uuname"
        echo "PD ::: $Upassw"
    echo "Done"
fi
