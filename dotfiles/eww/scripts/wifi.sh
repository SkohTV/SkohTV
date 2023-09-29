#!/bin/bash


network_name=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2-)

if [ -z "$network_name" ]; then
  network_name="N/A"
  state="󰖪"
else
  state="󰖩"
fi

ret=$(printf "{\"state\":\"%s\",\"value\":\"%s\"}" "$state" "$network_name")
echo "$ret"
