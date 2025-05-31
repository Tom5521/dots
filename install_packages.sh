#!/usr/bin/env bash

system_deps=(
	base-devel
	7zip
	cmake
)

pipewire_deps=(
	pipewire
	gst-plugin-pipewire
	libpipewire
	libwireplumber
	pipewire-alsa
	pipewire-audio
	pipewire-docs
	pipewire-ffado
	pipewire-jack
	pipewire-pulse
	pipewire-roc
	pipewire-session-manager
	pipewire-v4l2
	wireplumber
	alsa-utils
)

wayland_deps=(
	wlroots
	xdg-desktop-portal-hyprland
	xdg-desktop-portal-gtk
	xdg-desktop-portal-wlr
)

lang_deps=(
	lua
	lua51
	rustup
	luarocks
	tree-sitter-lua
)

env_deps=(
	hyprland
	swaync
	nwg-look
	nwg-clipman
	kitty
	hyprshade
	zenity
	cliphist
	wl-clipboard
	network-manager-applet
	kdeconnect
	kactivitymanagerd
	wofi
	grim
	slurp
	gtklock
	playerctl
	hyprprop
	walker-bin
	glava
	swww
	waypaper
	waybar-cava
	waybar-module-pacman-updates-git
	cava
	hyprshot
	thunar
	nvim
	gnome-calculator
	mpv
)

custom_kernel_pkgs=(
	linux-xanmod-lts
	linux-xanmod-lts-headers
)

usr_pkgs=(
	nvim
	zen-browser-bin
	strawberry
	go
	kdenlive
	audacity
	vorta
	vmware-workstation
	vesktop
	obsidian
	libreoffice-fresh-es
	anydesk
	gparted
	grub-customizer
	obs-studio
	kate
	okular
	virtualbox
	virtualbox-host-dkms
	gimp
	vlc
	fish
	gthumb
	btop
	qbittorrent
	scrcpy
)

pkg_install() {
	yay -S --needed "$@" --noconfirm
}

main() {
	password=$(mktemp)

	dialog --insecure --title "Enter sudo password" --passwordbox "" 0 0 2>"$password"
	ok=$?
	clear
	sudo -v -S <"$password"
	rm "$password"

	if [ $ok -ne 0 ]; then
		return
	fi

	opts=$(
		dialog --separate-output --checklist "Select the options" 0 0 0 1 "System dependencies" on \
			2 "Pipewire dependencies" off \
			3 "Wayland dependencies" on \
			4 "Programming language dependencies" on \
			5 "Environment dependencies" on \
			6 "Custom linux kernel" off \
			7 "User packages" off \
			3>&1 1>&2 2>&3
	)
	ok=$?
	if [ $ok -ne 0 ]; then
		clear
		return
	fi

	clear
	yay -Sy
	for opt in $opts; do
		case $opt in
		1) pkg_install "${system_deps[@]}" ;;
		2) pkg_install "${pipewire_deps[@]}" ;;
		3) pkg_install "${wayland_deps[@]}" ;;
		4) pkg_install "${lang_deps[@]}" ;;
		5) pkg_install "${env_deps[@]}" ;;
		6) pkg_install "${custom_kernel_pkgs[@]}" ;;
		7) pkg_install "${usr_pkgs[@]}" ;;
		esac
	done
}

main
