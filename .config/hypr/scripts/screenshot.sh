#!/usr/bin/env bash

grim -g "$(slurp)" "$(xdg-user-dir PICTURES)/Screenshots/$(date +"%d-%m-%Y %H:%M:%S").png"
