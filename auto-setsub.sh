#!/bin/bash

az account list --output table > list_subscription.txt
cat list_subscription.txt

awk 'NR==3' list_subscription.txt > 1sub.txt
awk 'NR==4' list_subscription.txt > 2sub.txt

cut -c 33-70 1sub.txt > 1.1sub.txt
cut -c 33-70 2sub.txt > 2.1sub.txt

rm -rf 1sub.txt 2sub.txt

setsubid1=$(head -1 1.1sub.txt)
setsubid2=$(head -1 2.1sub.txt)

echo $setsubid1
echo $setsubid2

echo "Cai Group mac dinh"
echo "az account set --subscription $setsubid1"
echo "az account set --subscription $setsubid2"
rm -rf 1.1sub.txt 2.1sub.txt

