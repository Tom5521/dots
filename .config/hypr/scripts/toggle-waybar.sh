#!/bin/bash

cd ~/.config/hypr/scripts/
source ./shared.sh

program=waybar
exec_cmd="waybar"

Toggle "$program" "$exec_cmd" 1
