#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
###########- END COLOR CODE -##########
# ==========================================
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
IP=$(wget -qO- ipinfo.io/ip);
domain=$(cat /etc/xray/domain)
date=$(date +"%Y-%m-%d")
clear
email=$(cat /root/email)
if [[ "$email" = "" ]]; then
echo "Masukkan Email Untuk Menerima Backup"
read -rp "Email : " -e email
cat <<EOF>>/root/email
$email
EOF
fi
clear
echo -e "\033[0;34m Mohon Menunggu , Proses Backup sedang berlangsung !!! \033[0m"
rm -rf /root/backup
mkdir /root/backup
cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp -r /etc/passwd /root/backup/ &> /dev/null
cp -r /etc/group /root/backup/ &> /dev/null
cp -r /etc/shadow /root/backup/ &> /dev/null
cp -r /etc/gshadow /root/backup/ &> /dev/null
cp -r /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
cp -r /var/lib/cbt /root/backup &> /dev/null
cp -r /etc/xray /root/backup/xray &> /dev/null
cp -r /etc/per /root/backup/per &> /dev/null
#cp -r /root/nsdomain backup/nsdomain &> /dev/null
#cp -r /etc/slowdns backup/slowdns &> /dev/null
cp -r /etc/nginx/conf.d /root/backup/conf.d/ &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp -r /etc/crontab /root/backup/crontab &> /dev/null

#cp -r /root/.acme.sh /backup
#cp /etc/passwd backup/
#cp /etc/group backup/
#cp /etc/shadow backup/
#cp /etc/gshadow backup/
#cp /etc/crontab backup/
#cp /etc/cron.d backup/cron.d
#cp -r /var/lib backup/lib
#cp -r /etc/xray backup/xray
#cp -r /etc/per backup/per
#cp -r /etc/slowdns backup/slowdns
#cp -r /etc/nginx/conf.d backup/conf.d
#cp -r /home/vps/public_html backup/public_html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "
Detail Backup 
==================================
IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date
==================================
" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
clear
TEXT="
<code>========================</code>
<code>      Detail Backup     </code>
<code>===========BY===========</code>
<code>  PAPADA'AN STORE AUTOSCRIPT </code>
<code>========================</code>
<code>DOMAIN     : ${domain}</code>
<code>========================</code>
<code>IP VPS     : ${IP}</code>
<code>========================</code>
<code>Link Backup:</code> $link
<code>========================</code>
<code>Tanggal    : $date</code>
<code>========================</code>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo ""
clear
echo -e "
==================================
         Detail Backup 
               By
 PAPADA'AN STORE AUTOSCRIPT
==================================
IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date
==================================
"
echo "Cek Email Kamu Link Backup Sudah Dikirim"
echo "               Atau  "
echo "Copy Link Di Atas Dan Restore Di VPS Baru"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
