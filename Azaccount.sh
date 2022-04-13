#! /bin/bash

# get account email list
az account list > azaccountlist.txt
    awk 'NR==12' azaccountlist.txt > azaccountlistdraw.txt
cut -c 16-23 azaccountlistdraw.txt > azacc.txt
    awk '{print tolower($0)}' azacc.txt > azacc1.txt
        rm azacc.txt
        mv azacc1.txt azacc.txt
rm -rf azaccountlist.txt azaccountlist.txt azaccountlistdraw.txt
    GetUsername=$(cat azacc.txt)

ARRPASSWORD=(
"3782536aY@jEWb"
"95037836sf@OEb"
"n9udL@GNZLBnPLT"
"Av9C05XK@7aeWdJ"
"tSEJN@5fHrRe7UG"
"hDAA6iz@fM9Amt"
"s8xARU@4zLvgoc0"
"FP730js@UUxXCfX"
"ehhddv@51b2B95Rs"
"bp6Ki@gUkFMVIm5"
"dbn39@iG4ycHXVt"
"NDRXuqYo@4DvVdtu"
"CRh2mb@Qd8VGRSs"
"UZ1v5W6N5Iw0@m"
"kFxUnL@jLVVW4Xo"
"EyuF1w@bH3TyUkC"
"YrL44E@xVfYHHp7"
"z9dTwGU@gkyCAHA"
"prL0kX@8SGkExu"
"mIIMuhd@7jVdZeV"
"LreXfU1@DTzlbMj"
"BZGhFeWN@vADw57")

SETUSERNAME=$GetUsername
    echo $SETUSERNAME > inuser.txt

SETPASSWD=($(shuf -n1 -e "${ARRPASSWORD[@]}"))
    echo $SETPASSWD > inpass.txt

#xoa ky tu dac biet
sed -e 's/[^a-zA-Z*0-9]/ /g;s/  */ /g' inuser.txt > inuser_1.txt
sed 's/ //g' inuser_1.txt > inuser.txt

rm -rf inuser_1.txt
