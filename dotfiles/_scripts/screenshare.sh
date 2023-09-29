#!/bin/bash

# Show all connected displays
# xrandr -q | grep connected

# This part of the script duplicate the display
xrandr --output HDMI-1-1 --auto --same-as eDP-1
