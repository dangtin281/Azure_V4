
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
echo "08. australiseast"
echo "09. southeastasia"
echo "10. northeurope"
echo "11. uksouth"
echo "12. westeurope"
echo "13. koreacentral"
echo "14. canadacentral"
echo "15. francecentral"
echo "16. switzenlandnorth"
echo "17. eastasia"
echo "18. INPUT CUSTOM REGION NAME"
echo "=====================CAC REGION DA TAO TRUOC DAY========================"
cat created.txt
echo ""
echo "Q.Quit" 
echo 
echo "Enter choice" 
read choice 
case $choice in 
1) locationset=eastus
    break;;
2) locationset=eastus2
    break;;
3) locationset=southcentralus
    break;;
4) locationset=westus
    break;;
5) locationset=westus2
    break;;
6) locationset=westus3
    break;;
7) locationset=centralus
    break;;
8) locationset=australiseast
    break;;
9) locationset=southeastasia
    break;;
10) locationset=northeurope
    break;;
11) locationset=uksouth
    break;;
12) locationset=westeurope
    break;;
13) locationset=koreacentral
    break;;
14) locationset=canadacentral
    break;;
15) locationset=francecentral
    break;;
16) locationset=switzenlandnorth
    break;;
17) locationset=eastasia
    break;;
18) unset locationset_cus
	read -p "Nhap vao ten Region: " locationset_cus
	echo "Data received"
	echo $locationset_cus
	locationset=$locationset_cus
    break;;	

Q|q) quit=y;; 
*) echo "Try Again" 
esac 
done 
