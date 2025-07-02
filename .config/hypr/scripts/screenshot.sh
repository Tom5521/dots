#!/usr/bin/env bash

main() {
  path="$(xdg-user-dir PICTURES)/Screenshots/\
  $(date +"%d-%m-%Y %H:%M:%S").png"

  hyprshot -m region --raw >"$path"

  # Operation cancelled.
  if [[ "$(stat -c "%s" "$path")" == "0" ]]; then
    rm "$path"
    return
  fi
  sleep 1
  copyq write image/png - <"$path"
}

main
