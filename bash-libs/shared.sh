#!/bin/bash

toggle_service() {
  local service_name=$1
  systemctl --user is-active --quiet "$service_name" &&
    systemctl --user stop "$service_name" ||
    systemctl --user start "$service_name"
}

# $1 = class & title, $2 = command, $3 = optional arguments $4 = hold.
run_kitty() {
  local class=$1
  local command=$2
  local args=$3
  local hold=$4
  [[ $hold == 1 ]] && args="$args --hold"
  # I run the command with the shell to make kitty run with the user's custom environment variables.
  kitty $args -T "$class" --class "$class" -e $SHELL -c "$command"
}

# $1 = program, $2 = command, $3 = hide notification
toggle_program() {
  local program="$1"
  local cmd="$2"
  local hide="$3"
  local pkill_args=$4

  notify() {
    if [[ "$hide" != 1 ]]; then
      notify-send "$@"
    fi
  }

  if pkill $pkill_args -x "$program"; then
    notify "$program killed."
  else
    notify "Starting $program..."
    $SHELL -c "$cmd" || notify "Error starting $program [exit code $?]" &
  fi
}

toggle_kitty() {
  local cmd=$1
  local class=$2
  local kitty_args=$3

  toggle_program "$cmd" "kitty $kitty_args -T \"$class\" --class \"$class\" -e $SHELL -c \"$cmd\"" 1
}
