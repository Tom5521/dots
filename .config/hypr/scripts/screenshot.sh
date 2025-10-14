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
  local screenshot_file
  screenshot_file="$(date +"%d-%m-%Y %H:%M:%S").png"
  local screenshot_dir
  screenshot_dir="$(xdg-user-dir PICTURES)/Screenshots"
  local screenshot_path="$screenshot_dir/$screenshot_file"

  local current_shader
  if [ $must_toggle_hyprshade -eq 0 ]; then
    current_shader=$(hyprshade current)
    hyprshade off
  fi

  hyprshot -m region --freeze -s --raw >"$screenshot_path"

  # wait til' the writing is done
  while lsof "$screenshot_path" >/dev/null 2>&1; do
    sleep 0.1s
  done

  if [ $must_toggle_hyprshade -eq 0 ]; then
    hyprshade on "$current_shader"
  fi

  copyq write image/png - <"$screenshot_path"
  copyq select 0
}

main
