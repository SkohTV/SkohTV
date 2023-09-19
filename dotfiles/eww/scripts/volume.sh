#!/bin/bash

output=$(pactl list sinks | grep -A 20 'Sink #0' | awk '/Mute:/ {mute=$2} /Volume: front/ {gsub("%", "", $5); volume=$5} END {print mute, volume}')

mute=$(echo "$output" | awk '{print $1}')
volume=$(echo "$output" | awk '{print $2}')
mute_return="NA"

if [ "$mute" = "no" ]; then
  if [ "$volume" -lt 33 ]; then
    mute_return="󰕿";
  elif [ "$volume" -lt 66 ]; then
    mute_return="󰖀";
  else
    mute_return="󰕾";
  fi
else
  mute_return="󰝟";
fi

ret=$(printf "{\"state\":\"%s\",\"value\":%s}" "$mute_return" "$volume")
echo "$ret"