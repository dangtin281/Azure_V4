#!/bin/bash 
Uname=$(ls /home)
sudo echo $Uname > inuser.txt
cp -r inuser.txt /home/$Uname/inuser.txt
