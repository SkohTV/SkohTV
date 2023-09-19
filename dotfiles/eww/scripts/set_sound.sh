#!/bin/bash


pactl set-sink-volume 0 "$1"%

if [ "$1" -eq 0 ]; then
  pactl set-sink-mute 0 true
else
  pactl set-sink-mute 0 false
fi