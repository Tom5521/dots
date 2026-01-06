#!/usr/bin/env bash

main() {
  local screenshot_path
  screenshot_path="$(xdg-user-dir PICTURES)/Screenshots/$(date +"%d-%m-%Y %H:%M:%S").png"

  mkdir -p "$(dirname "$screenshot_path")"

  hyprshot -m region --freeze -s --raw >"$screenshot_path"

  # wait til' the writing is done
  while lsof "$screenshot_path" >/dev/null 2>&1; do
    sleep 0.1s
  done

  copyq write image/png - <"$screenshot_path"
  copyq select 0
}

main
