#!/bin/bash
# //====================================================
# //	System Request:Debian 9+/Ubuntu 18.04+/20+
# //	Author:	Julak Bantur
# //	Dscription: Xray Menu Management
# //	email: putrameratus2@gmail.com
# //  telegram: https://t.me/Cibut2d
# //====================================================
# // font color configuration | JULAK BANTUR AUTOSCRIPT
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m"
grenbo="\e[92;1m"
GRENN="\e[92;1m"
WC='\033[0m'
WH='\033[1;37m'
###########- END COLOR CODE -##########
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
clear
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
res1() {
    wget "https://raw.githubusercontent.com/rajaganjil93/kdg/main/menu.zip"
    unzip menu.zip
    chmod +x menu/*
    mv menu/* /usr/bin
    rm -rf menu
    rm -rf menu.zip
    rm -rf update.sh
}
netfilter-persistent
clear
echo -e "\033[0;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[34m       UPDATE MENU AUTOSCRIPT       \033[0m"
echo -e "\033[0;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "  \033[1;37m update script service\033[1;37m"
fun_bar 'res1'
echo -e "\033[0;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
