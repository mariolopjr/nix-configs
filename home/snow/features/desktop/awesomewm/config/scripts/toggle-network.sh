#!/usr/bin/env bash

name=$(iwgetid -r)
if [[ "$name" == "" ]]; then
  nmcli con up ifname "$(/usr/bin/ls /sys/class/ieee80211/*/device/net/)"
else
  wifiname=$(nmcli -t -f NAME connection show --active)
  nmcli con down id "${wifiname}"
fi
