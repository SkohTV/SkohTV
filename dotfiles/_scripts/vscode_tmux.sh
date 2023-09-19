#!/bin/bash

WD=$(pwd)
tmux send-keys -t vscode "cd $WD ; clear ; ll" ENTER
code .
