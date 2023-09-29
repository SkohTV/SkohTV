#!/bin/bash

file=$(upower -e | grep 'BAT' | tr -d '\n')
data=$(upower -i "$file" | grep -E "state|percentage|time to full|time to empty" | tr -d "%")

state=$(echo $data | grep -oP 'state: \K\w+')
percentage=$(echo $data | grep -oP 'percentage: \K\d+')
state_return="NA"


if [ "$state" = "discharging" ]; then
  if [ "$percentage" -lt 10 ]; then
    state_return="󰁺";
  elif [ "$percentage" -lt 20 ]; then
    state_return="󰁻";
  elif [ "$percentage" -lt 30 ]; then
    state_return="󰁼";
  elif [ "$percentage" -lt 40 ]; then
    state_return="󰁽";
  elif [ "$percentage" -lt 50 ]; then
    state_return="󰁾";
  elif [ "$percentage" -lt 60 ]; then
    state_return="󰂀";
  elif [ "$percentage" -lt 70 ]; then
    state_return="󰂀";
  elif [ "$percentage" -lt 80 ]; then
    state_return="󰂁";
  elif [ "$percentage" -lt 90 ]; then
    state_return="󰂂";
  else
    state_return="󰁹";
  fi
else
  if [ "$percentage" -eq 100 ]; then
    state_return="󰂃";
  else
    state_return="󰂄";
  fi
fi

ret=$(printf "{\"state\":\"%s\",\"value\":%s}" "$state_return" "$percentage")
echo "$ret"