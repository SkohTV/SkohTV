#!/bin/bash


val=$(awk -v bright="$1" 'BEGIN{print (bright/20)}')
xrandr --output eDP-1 --brightness "$val"