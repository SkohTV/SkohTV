#!/bin/bash


current=$(bspc query -D -d --names --desktop focused)
echo $current