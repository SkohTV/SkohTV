#!/bin/bash


output=$(pactl list sinks | grep -A 20 'Sink #0' | awk '/Mute:/ {mute=$2} /Volume: front/ {gsub("%", "", $5); volume=$5} END {print mute, volume}')
mute=$(echo "$output" | awk '{print $1}')

if [ "$mute" == "no" ]; then
  pactl set-sink-mute 0 true
else
  pactl set-sink-mute 0 false
fi