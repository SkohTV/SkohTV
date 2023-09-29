#!/bin/bash


## Files and cmd

## Run eww daemon if not running already
if [[ ! $(pidof eww) ]]; then
	eww daemon
	sleep 1
fi

bspc config -m LVDS-1 top_padding 49

eww close-all
eww open bar
