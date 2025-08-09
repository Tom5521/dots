#!/usr/bin/env bash

password=""

pkg_install() {
	echo "$password" | sudo -v -S
	xargs yay -S --needed --noconfirm <"./pkg-lists/$1.txt"
}

main() {
	opts=$(
		dialog --separate-output --checklist "Select the options" 0 0 0 1 "System dependencies" on \
			2 "Pipewire dependencies" off \
			3 "Wayland dependencies" on \
			4 "Programming language dependencies" on \
			5 "Environment dependencies" on \
			6 "Custom linux kernel" off \
			7 "User packages" off \
			8 "QT dependencies" off \
			3>&1 1>&2 2>&3
	)
	ok=$?
	if [ $ok -ne 0 ]; then
		clear
		return
	fi

	password=$(
		dialog --insecure --title "Enter sudo password" --passwordbox "" \
			0 0 \
			3>&1 1>&2 2>&3
	)
	ok=$?
	clear
	echo "$password" | sudo -v -S

	if [ $ok -ne 0 ]; then
		return
	fi

	yay -Sy
	for opt in $opts; do
		case $opt in
		1) pkg_install "sysdeps" ;;
		2) pkg_install "pipewire-deps" ;;
		3) pkg_install "wayland-deps" ;;
		4) pkg_install "lang-deps" ;;
		5) pkg_install "env-deps" ;;
		6) pkg_install "kernel-pkgs" ;;
		7) pkg_install "usr-pkgs" ;;
		8) pkg_install "qt-deps" ;;
		esac
	done
}
main
