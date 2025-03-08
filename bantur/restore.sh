#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
clear
echo "Silahkan Masukin Link Backupnya"
read -rp "Link File: " -e url
wget -O backup.zip "$url"
unzip backup.zip
rm -f backup.zip
sleep 1
echo Start Restore
cp -r /root/backup/passwd /etc/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring group data..."
sleep 1
cp -r /root/backup/group /etc/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring shadow data..."
sleep 1
cp -r /root/backup/shadow /etc/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring gshadow data..."
sleep 1
cp -r /root/backup/gshadow /etc/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring chap-secrets data..."
sleep 1
cp -r /root/backup/chap-secrets /etc/ppp/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring passwd1 data..."
sleep 1
#cp -r /root/backup/passwd1 /etc/ipsec.d/passwd &> /dev/null
#echo -e "[ ${GREEN}INFO${NC} ] • Restoring ss.conf data..."
#sleep 1
#cp -r /root/backup/ss.conf /etc/shadowsocks-libev/ss.conf &> /dev/null
#echo -e "[ ${GREEN}INFO${NC} ] • Restoring admin data..."
#sleep 1
cp -r /root/backup /var/lib/cbt &> /dev/null
#cp -r /root/backup/wireguard /etc/ &> /dev/null
cp -r /root/backup/.acme.sh /root/ &> /dev/null
cp -r /root/backup/xray /etc/xray &> /dev/null
#cp -r /root/backup/slowdns /etc/slowdns &> /dev/null
cp -r /root/backup/per /etc/per &> /dev/null
cp -r /root/backup/conf.d /etc/nginx/ &> /dev/null
#cp -r /root/backup/shadowsocksr /usr/local/ &> /dev/null
cp -r /root/backup/public_html /home/vps/ &> /dev/null
cp -r /root/backup/crontab /etc/ &> /dev/null
cp -r /root/backup/cron.d /etc/ &> /dev/null
systemctl restart xray

rm -rf /root/backup
rm -f backup.zip
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
