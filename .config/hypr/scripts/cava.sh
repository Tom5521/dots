#!/bin/bash

cd ~/.config/hypr/scripts/
source ./shared.sh

KITTY_DISABLE_WAYLAND=1 ToggleKitty cava GLava "--override background_opacity=0"
