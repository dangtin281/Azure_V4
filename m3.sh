#!/bin/bash

gitpath=$(head -1 gitpath.txt)

wget https://raw.githubusercontent.com/$gitpath/main/auto-install.sh
chmod +x auto-install.sh

sh auto-install.sh
