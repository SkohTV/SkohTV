#!/bin/bash


brightness=$(xrandr --verbose --current | grep ^"eDP-1" -A5 | tail -1 | awk '/Brightness/ {print $2}' )
val=$(awk -v bright="${brightness}" 'BEGIN{print (bright*100)}')
val2=$(awk -v bright="${brightness}" 'BEGIN{print (bright*20)}')
ret=$(printf "{\"hundred\":%s,\"twenty\":%s,\"real\":%s}" "$val" "$val2" "$brightness")
echo "$ret"
