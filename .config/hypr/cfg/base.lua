return {
	general = {
		gaps_in = 2,
		gaps_out = 10,
		border_size = 0,
		col = {
			active_border = {
				colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
				angle = 45,
			},
			inactive_border = {
				colors = { "rgba(595959aa)" },
			},
		},
		-- layout = "dwindle",
		layout = "scrolling",
	},
	decoration = {
		blur = {
			enabled = true,
			size = 2,
			passes = 1,
			new_optimizations = false,
			noise = 0.01,
		},

		rounding = 0,
		inactive_opacity = 0.7,
		active_opacity = 1,
		dim_inactive = true,
		dim_strength = 0.2,
	},

	dwindle = {
		preserve_split = true,
	},
	input = {
		kb_layout = "es",
		accel_profile = "adaptative",
	},

	misc = {
		enable_anr_dialog = false,
		focus_on_activate = true,
	},

	cursor = {
		no_hardware_cursors = true,
	},

	master = {
		new_status = "slave",
		orientation = "left",
		new_on_top = true,
		allow_small_split = true,
	},
	scrolling = {
		direction = "right",
		column_width = 0.99,
		fullscreen_on_one_column = true,
	},

	animations = { enabled = true },
}
