hl.window_rule({
	match = {
		class = "kitty",
	},

	workspace = 1,
})

hl.window_rule({
	match = {
		class = "firefox|Firefox|librewolf|floorp|Thorium-browser|zen-alpha|zen-beta|zen",
	},
	workspace = 2,
})

hl.window_rule({
	match = {
		class = "thunar|Thunar|org\\.gnome\\.Nautilus",
	},
	workspace = 3,
})

hl.window_rule({
	match = {
		class = "Neovim$|goneovim|Code|neovide",
	},
	workspace = 4,
})

hl.window_rule({
	match = {
		class = "youtube-music-desktop-app|YouTube Music|org\\.strawberrymusicplayer\\.strawberry|Clementine",
	},

	workspace = 5,
})

hl.window_rule({
	match = {
		title = "Picture-in-Picture|Pantalla en pantalla",
	},

	float = true,
	pin = true,
	opaque = true,
	size = { 390, 220 },
	no_dim = true,
})

hl.window_rule({
	match = {
		class = "^$",
	},

	opaque = true,
	no_shadow = true,
	no_blur = true,
	no_dim = true,
})

hl.window_rule({
	match = {
		title = ".*YouTube.*",
	},
	opaque = true,
	no_shadow = true,
	no_blur = true,
	no_dim = true,
})

hl.window_rule({
	match = {
		class = "[Xx]dg-desktop-portal.*",
	},

	opaque = true,
	no_shadow = true,
	no_blur = true,
	float = true,
})

hl.window_rule({
	match = {
		class = "zenity",
	},
	float = true,
	pin = true,
	opaque = true,
	no_dim = true,
	size = { 1030, 565 },
})

hl.window_rule({
	match = {
		class = "nwg-look",
	},
	pseudo = true,
	size = { 600, 470 },
})

hl.window_rule({
	match = {
		class = "cava|GLava",
	},
	no_shadow = true,
	no_blur = true,
	float = true,
	pin = true,
	no_dim = true,
	fullscreen = true,
})

hl.window_rule({
	match = {
		class = "^.*scrcpy.*$",
	},
	float = true,
	opaque = true,
})

hl.window_rule({
	match = {
		class = "waypaper",
	},
	pseudo = true,
	size = { 770, 675 },
})

hl.window_rule({
	match = {
		class = "org\\.gnome\\.Calculator",
	},
	float = true,
	size = { 410, 620 },
})

hl.window_rule({
	match = {
		class = "com\\.borgbase\\.Vorta",
	},
	pseudo = true,
	size = { 1000, 600 },
})

hl.window_rule({
	match = {
		class = "xfce-polkit|polkit-mate-authentication-agent-1",
	},
	pin = true,
	float = true,
})

hl.window_rule({
	match = {
		class = "org\\.kde\\.kdeconnect.*",
	},
	pseudo = true,
})

hl.window_rule({
	match = {
		class = "org\\.kde.kdeconnect\\.handler",
	},
	float = true,
	size = { 540, 160 },
})

hl.window_rule({
	match = {
		class = "com\\.github.hluk\\.copyq",
	},
	float = true,
	pin = true,
})

-- Reglas anónimas (sin nombre)
hl.window_rule({
	match = {
		class = "blueman-sendto",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "wlogout",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "pavucontrol",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "qalculate-gtk",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "aimp\\.exe",
		title = "TrayControl",
	},
	no_shadow = true,
})
