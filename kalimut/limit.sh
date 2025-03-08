REPO="https://raw.githubusercontent.com/rajaganjil93/lite/main/"
wget -q -O /etc/systemd/system/limitssh.service "${REPO}kalimut/limitssh.service" && chmod +x limitssh.service >/dev/null 2>&1
wget -q -O /etc/systemd/system/limitvmess.service "${REPO}kalimut/limitvmess.service" && chmod +x limitvmess.service >/dev/null 2>&1
wget -q -O /etc/systemd/system/limitvless.service "${REPO}kalimut/limitvless.service" && chmod +x limitvless.service >/dev/null 2>&1
wget -q -O /etc/systemd/system/limittrojan.service "${REPO}kalimut/limittrojan.service" && chmod +x limittrojan.service >/dev/null 2>&1
#wget -q -O /etc/systemd/system/limitshadowsocks.service "${REPO}kalimut/limitshadowsocks.service" && chmod +x limitshadowsocks.service >/dev/null 2>&1
wget -q -O /etc/xray/limit.vmess "${REPO}kalimut/vmess" >/dev/null 2>&1
wget -q -O /etc/xray/limit.vless "${REPO}kalimut/vless" >/dev/null 2>&1
wget -q -O /etc/xray/limit.trojan "${REPO}kalimut/trojan" >/dev/null 2>&1
#wget -q -O /etc/xray/limit.shadowsocks "${REPO}kalimut/shadowsocks" >/dev/null 2>&1
chmod +x /etc/ssh/limit.ssh
chmod +x /etc/xray/limit.vmess
chmod +x /etc/xray/limit.vless
chmod +x /etc/xray/limit.trojan
#chmod +x /etc/xray/limit.shadowsocks
systemctl daemon-reload
systemctl enable --now limitssh
systemctl enable --now limitvmess
systemctl enable --now limitvless
systemctl enable --now limittrojan
#systemctl enable --now limitshadowsocks
# systemctl start limitssh
# systemctl start limitvmess
# systemctl start limitvless
# systemctl start limittrojan
# systemctl start limitshadowsocks
# systemctl restart limitssh
# systemctl restart limitvmess
# systemctl restart limitvless
# systemctl restart limittrojan
# systemctl restart limitshadowsocks
