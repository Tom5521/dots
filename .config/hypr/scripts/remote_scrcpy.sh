#!/bin/bash

source ~/bash-libs/shared.sh

ip=$(zenity --entry --title="Enter phone IP" --entry-text="$(fish -c 'get_public_ip')")

toggle_program scrcpy "scrcpy --tcpip='$ip' --no-video --no-window"
