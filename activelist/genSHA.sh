#!/bin/bash

clear

echo "riglist sha updater"
rm -f /tmp/riglist.js*
rm -f /tmp/ovpn.con*
sleep 1
ult_active_list="https://raw.githubusercontent.com/ExtremeDot/myNotes/main/activelist/riglist.json"
latest_online_ovpn="https://raw.githubusercontent.com/ExtremeDot/myNotes/main/activelist/ovpn.conf"
sleep 1
cd /tmp

wget $ult_active_list
wget $latest_online_ovpn
sleep 2
cat /tmp/riglist.json
echo "- riglist ----------------------"
sha256sum /tmp/riglist.json | awk '{print $1}'

echo "- open vpn conf ----------------------"
sha256sum /tmp/ovpn.conf | awk '{print $1}'
