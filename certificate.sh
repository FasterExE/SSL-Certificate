#!/bin/bash
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'

clear
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "                    ${BIWhite}${UWhite}SSL CERTIFICATE${NC}"
echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -ne "${BIYellow}   Domain/Host : ${BIPurple}"; read domain
scoat() {
sudo apt install socat -y
}
certificate() {
mkdir /root/.acme.sh
mkdir /etc/ilyass
rm /etc/ilyass/ilyass.crt
rm /etc/ilyass/ilyass.key
#curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
curl https://raw.githubusercontent.com/acmesh-official/acme.sh/refs/heads/master/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/ilyass/ilyass.crt --keypath /etc/ilyass/ilyass.key --ecc
}
scoat
certificate
echo -e "${BIPurple}   Certificate Path: ${BIWhite}/etc/ilyass/ilyass.crt"
echo -e "${BIPurple}   Key Path        : ${BIWhite}/etc/ilyass/ilyass.key"

echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"
echo "   Don't forget to renew cert"
read -n 1 -s -r -p "   Press any key to exit"
