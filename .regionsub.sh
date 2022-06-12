
quit=n 
while [  "$quit"   =   "n"  ] 
do 
echo 
echo "============================CREATEVM===================================="
echo "01. eastus"
echo "02. eastus2"
echo "03. southcentralus"
echo "04. westus"
echo "05. westus2"
echo "06. westus3"
echo "07. centralus"
echo "08. australiaeast"
echo "09. southeastasia"
echo "10. northeurope"
echo "11. uksouth"
echo "12. westeurope"
echo "13. koreacentral"
echo "14. canadacentral"
echo "15. francecentral"
echo "16. switzenlandnorth"
echo "17. eastasia"
echo "18. brazilsouth"
echo "19. INPUT CUSTOM REGION NAME"
echo "=====================CAC REGION DA TAO TRUOC DAY========================"
cat created.txt
echo ""
echo "Q.Quit" 
echo 
echo "Enter choice" 
read choice 
case $choice in 
1) vmlocationsub=eastus
    break;;
2) vmlocationsub=eastus2
    break;;
3) vmlocationsub=southcentralus
    break;;
4) vmlocationsub=westus
    break;;
5) vmlocationsub=westus2
    break;;
6) vmlocationsub=westus3
    break;;
7) vmlocationsub=centralus
    break;;
8) vmlocationsub=australiaeast
    break;;
9) vmlocationsub=southeastasia
    break;;
10) vmlocationsub=northeurope
    break;;
11) vmlocationsub=uksouth
    break;;
12) vmlocationsub=westeurope
    break;;
13) vmlocationsub=koreacentral
    break;;
14) vmlocationsub=canadacentral
    break;;
15) vmlocationsub=francecentral
    break;;
16) vmlocationsub=switzenlandnorth
    break;;
17) vmlocationsub=eastasia
    break;;
18) vmlocationsub=brazilsouth
    break;;  
19) unset vmlocationsub
	read -p "Nhap vao ten Region: " vmlocationsub1
	echo "Data received"
	echo $vmlocationsub1
	vmlocationsub=$vmlocationsub1
    break;;	

Q|q) quit=y;; 
*) echo "Try Again" 
esac 
done 
