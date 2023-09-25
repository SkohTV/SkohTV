#!/bin/bash


network_data=$(
  nmcli -t -f in-use,bssid,ssid,mode,chan,rate,signal,bars,security dev wifi |
  grep "^\*"
)
id=0


for (( i=0; i<${#network_data}; i++ )); do
  if [ "$skip" == 1 ]; then
    skip=0
  elif [ "${network_data:$i:1}" == ":" ]; then
    id=$((id+1))
  elif [ "${network_data:$i:1}" == "\\" ]; then
    skip=1
  else
    case $id in
      0) in_use+="${network_data:$i:1}" ;;
      1) bssid+="${network_data:$i:1}" ;;
      2) ssid+="${network_data:$i:1}" ;;
      3) mode+="${network_data:$i:1}" ;;
      4) chan+="${network_data:$i:1}" ;;
      5) rate+="${network_data:$i:1}" ;;
      6) signal+="${network_data:$i:1}" ;;
      7) bars+="${network_data:$i:1}" ;;
      8) security+="${network_data:$i:1}" ;;
    esac
  fi
done

bars_ret="N/A"
case $bars in
  "▂___"|"*   ") bars_ret="󰤟" ;;
  "▂▄__"|"**  ") bars_ret="󰤢" ;;
  "▂▄▆_"|"*** ") bars_ret="󰤥" ;;
  "▂▄▆█"|"****") bars_ret="󰤨" ;;
esac


bssid=$(echo "$bssid" | sed -E 's/(..)/\1:/g; s/:$//')



ret=$(printf "{
  \"in_use\":\"%s\",
  \"bssid\":\"%s\",
  \"ssid\":\"%s\",
  \"mode\":\"%s\",
  \"chan\":\"%s\",
  \"rate\":\"%s\",
  \"signal\":\"%s\",
  \"bars\":\"%s\",
  \"security\":\"%s\"
}" "$in_use" "$bssid" "$ssid" "$mode" "$chan" "$rate" "$signal" "$bars_ret" "$security")
echo "$ret"


#if [ -z "$network_name" ]; then
#  network_name="N/A"
#  state="󰖪"
#else
#  state="󰖩"
#fi

#ret=$(printf "{\"state\":\"%s\",\"value\":\"%s\"}" "$state" "$network_name")
#echo "$network_name"
