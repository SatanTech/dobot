apt update -y && apt upgrade -y
apt install python3 python3-pip git -y
apt-get install libjpeg-dev zlib1g-dev -y
cd /etc/
git clone https://github.com/SatanTech/dobot.git
pip3 install -r /etc/dobot/requirements.txt

read -e -p "[*] Input your Nama Store : " nama
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin

sed -i "s/NAMA STORE/$nama/g" /etc/dobot/config.json &> /dev/null
sed -i "s/BOT TOKEN/$bottoken/g" /etc/dobot/config.json &> /dev/null
sed -i "s/ID TELEGRAM/$admin/g" /etc/dobot/config.json &> /dev/null
 
cat > /etc/systemd/system/dobot.service << END
[Unit]
Description=SGDO
After=network.target

[Service]
WorkingDirectory=/etc/dobot
ExecStart=/usr/bin/python3 -m main
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl enable dobot
systemctl start dobot

cd
rm install.sh
echo -e "Sukses Create Panel BOT Digital Ocean /start di bot untuk mulai"