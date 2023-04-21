#!/bin/bash

echo "riglist sha updater"
rm -f /tmp/riglist.json
sleep 1
ult_active_list="https://raw.githubusercontent.com/ExtremeDot/myNotes/main/activelist/riglist.json"
sleep 1
cd /tmp

wget $ult_active_list
sleep 2
cat /tmp/riglist.json
echo "-----------------------"
sha256sum /tmp/riglist.json | awk '{print $1}'
