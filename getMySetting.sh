#!/bin/bash

PKG=`dpkg -l | grep "Automates interactive applications"`

if [ "$PKG" ]; then
  echo "ready!"
else
  sudo apt update
  sudo apt install -y expect
fi

sleep 1

echo "git clone mySettings...."

expect <<EOF
spawn git clone https://github.com/leonardo204/mySettings.git
expect "Username for" { send "leonardo204\r" }
expect "Password for" { send "096d537d9679f6462434c2f60c3c89b413b7b4a3\r" }
interact
expect eof
EOF

echo ""
