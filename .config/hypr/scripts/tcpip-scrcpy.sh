#!/bin/bash

source ~/bash-libs/shared.sh

program=scrcpy
cmd="scrcpy --select-tcpip --tcpip --no-video --no-window"

toggle_program "$program" "$cmd"
