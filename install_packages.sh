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
	pipewire
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
	nwg-clipman
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

yesno() {
	whiptail --title "Install Packages" --yesno "$1" 8 39
	return $?
}

pkg_install() {
	yay -S --needed "$@" --noconfirm
}

main() {
	yay -Sy

	if yesno "Install system dependencies?"; then
		pkg_install "${system_deps[@]}"
	fi

	if yesno "Install pipewire dependencies?"; then
		pkg_install "${pipewire_deps[@]}"
	fi

	if yesno "Install wayland dependencies?"; then
		pkg_install "${wayland_deps[@]}"
	fi

	if yesno "Install language dependencies?"; then
		pkg_install "${lang_deps[@]}"
	fi

	if yesno "Install environment dependencies?"; then
		pkg_install "${env_deps[@]}"
	fi

	if yesno "Install custom linux kernel?"; then
		pkg_install "${custom_kernel_pkgs[@]}"
	fi

	if yesno "Install user packages?"; then
		pkg_install "${usr_pkgs[@]}"
	fi
}

main
