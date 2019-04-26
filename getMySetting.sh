#!/bin/bash

PKG=`dpkg -l | grep "Automates interactive applications"`

echo "1. check package!"
if [ "$PKG" ]; then
  echo "- ok."
else
  sudo apt update
  sudo apt install -y expect
fi

echo "2. get tokens!"
wget http://zerolive.iptime.org:204/github_token_zerolive7.txt
TOKEN=`cat github_token_zerolive7.txt`
echo "TOKEN="$TOKEN
sudo rm -rf github_token_zerolive7.txt

sleep 1

echo "3. git clone mySettings...."

expect <<EOF
spawn git clone https://github.com/leonardo204/mySettings.git
expect "Username for" { send "leonardo204\r" }
expect "Password for" { send "$TOKEN\r" }
interact
expect eof
EOF

sudo rm -rf ./mySettings/.git

echo ""
