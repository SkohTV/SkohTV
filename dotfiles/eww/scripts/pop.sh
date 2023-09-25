#!/bin/bash

# Source : https://github.com/saimoomedits/eww-widgets/blob/main/eww/bar/scripts/pop

# Create file.lock
# If file.lock doesn't exist, close all other popups, then create it (and open popup)
# If file exist, then delete it (and close popup)



LOCK_FILE="$HOME/.cache/eww-bar-brightsound.lock"
EWW_BIN="eww"

if [[ ! -f "$LOCK_FILE" ]]; then
  #$EWW_BIN close bar-wifi bar-calendar
  touch "$LOCK_FILE"
  $EWW_BIN open bar_brightsound
else
  $EWW_BIN close bar_brightsound
  rm "$LOCK_FILE"
fi
