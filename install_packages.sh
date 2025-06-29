#!/usr/bin/env bash

system_deps=(
	base
	base-devel
	7zip
	cmake
	git
)

pipewire_deps=(
	pipewire
	libpipewire
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
	libwireplumber
	alsa-plugins
	alsa-utils
	gst-plugin-pipewire
	gst-plugins-good
	gst-plugins-bad
	gst-plugins-ugly
)

wayland_deps=(
	xdg-desktop-portal-hyprland
	xdg-desktop-portal-gtk
	xdg-desktop-portal-wlr
)

lang_deps=(
	lua
	lua51
	luarocks
	zig
	zls
	clang
	tree-sitter-lua
	go
	mingw-w64-gcc
)

qt_deps=(
	# Qt5
	qt5-3d qt5-connectivity qt5-datavis3d qt5-doc qt5-examples qt5-gamepad
	qt5-graphicaleffects qt5-imageformats qt5-location qt5-lottie qt5-multimedia
	qt5-networkauth qt5-purchasing qt5-quick3d qt5-quickcontrols qt5-quickcontrols2
	qt5-quicktimeline qt5-remoteobjects qt5-script qt5-scxml qt5-sensors qt5-serialbus
	qt5-serialport qt5-speech qt5-tools qt5-virtualkeyboard qt5-wayland qt5-webchannel
	qt5-webengine qt5-webglplugin qt5-websockets qt5-webview qt5-xmlpatterns qt5ct

	# Qt6
	qt6-3d qt6-charts qt6-connectivity qt6-datavis3d qt6-doc qt6-examples qt6-graphs
	qt6-grpc qt6-httpserver qt6-imageformats qt6-languageserver qt6-location qt6-lottie
	qt6-networkauth qt6-quick3d qt6-quick3dphysics qt6-quickeffectmaker qt6-quicktimeline
	qt6-remoteobjects qt6-scxml qt6-sensors qt6-serialbus qt6-serialport qt6-speech
	qt6-tools qt6-virtualkeyboard qt6-websockets qt6-webview qt6ct qtutilities-qt6
)

env_deps=(
	# Compositor & Environment
	hyprland swaync nwg-look nwg-clipman hyprshade hyprprop
	gtklock gtklock grim slurp glava glava swww wofi
	waybar-cava waybar-module-pacman-updates-git waypaper

	# GUI Apps
	kitty neovim neovide ghex gdu reflector zenity yad
	mpv gnome-calculator engrampa gimp vlc gthumb btop
	kate okular kdenlive audacity obs-studio

	# CLI Utilities
	eza downgrade github-cli cowsay lolcat wev pigz
	trash-cli playerctl advcpmv npm wget w3m viu

	# Network & Devices
	network-manager-applet networkmanager kdeconnect kactivitymanagerd gnome-keyring

	# File Manager
	thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman

	# Fonts & Look
	noto-fonts adobe-source-code-pro-fonts adwaita-qt5-git adwaita-qt6-git ttf-firacode-nerd

	# Misc
	copyq mate-polkit
)

custom_kernel_pkgs=(
	linux-xanmod-lts
	linux-xanmod-lts-headers
	linux
	linux-firmware
	linux-headers
	mkinitcpio-firmware
)

usr_pkgs=(
	upx vesktop vesktop vi vim neovim tmux perf refind rclone
	zen-browser-bin strawberry pipes.sh proton-ge-custom-bin
	mesa-utils preload obsidian ly libreoffice-fresh-es ntfs-3g
	anydesk scrcpy anydesk-bin gparted grub-customizer virtualbox
	virtualbox-guest-iso virtualbox-guest-utils virtualbox-host-dkms
	vorta vmware-workstation wakatime

	# Terminal & Shell
	fish

	# Productivity & Misc
	obsidian asciinema aspell-es aspell-pt aspell-ru
)

password=""

pkg_install() {
	echo "$password" | sudo -v -S
	yay -S --needed "$@" --noconfirm
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
		1) pkg_install "${system_deps[@]}" ;;
		2) pkg_install "${pipewire_deps[@]}" ;;
		3) pkg_install "${wayland_deps[@]}" ;;
		4) pkg_install "${lang_deps[@]}" ;;
		5) pkg_install "${env_deps[@]}" ;;
		6) pkg_install "${custom_kernel_pkgs[@]}" ;;
		7) pkg_install "${usr_pkgs[@]}" ;;
		8) pkg_install "${qt_deps[@]}" ;;
		esac
	done
}
main
