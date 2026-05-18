#!/bin/bash

source ~/bash-libs/shared.sh

program=scrcpy
cmd="scrcpy -d --no-video --no-window"

toggle_program "$program" "$cmd"
