#!/usr/bin/env bash

must_toggle_hyprshade() {
  command -v hyprshade &>/dev/null
  local has_hyprshade=$?
  local is_hyprshade_on

  if [ $has_hyprshade -eq 0 ]; then
    [[ "$(hyprshade current)" != "" ]]
    is_hyprshade_on=$?
  fi

  [[ $has_hyprshade -eq 0 && $is_hyprshade_on -eq 0 ]]
  return $?
}
must_toggle_hyprshade
must_toggle_hyprshade=$?

main() {
  local screenshot_path
  screenshot_path="$(xdg-user-dir PICTURES)/Screenshots/\
    $(date +"%d-%m-%Y %H:%M:%S").png"

  local current_shader
  if [ $must_toggle_hyprshade -eq 0 ]; then
    current_shader=$(hyprshade current)
    hyprshade off
  fi

  hyprshot -m region --raw >"$screenshot_path"
  sleep 1.5 # Wait til' the data is moved to the file.

  if [ $must_toggle_hyprshade -eq 0 ]; then
    hyprshade on "$current_shader"
  fi

  # Operation cancelled.
  if [[ "$(stat -c "%s" "$screenshot_path")" == "0" ]]; then
    rm "$screenshot_path"
    return
  fi

  copyq write image/png - <"$screenshot_path"
}

main
