local M = require("cfg.settings")

local function ft(s)
	return string.gsub(s, "MAIN", M.main_mod, 1)
end

hl.bind(ft("MAIN + Q"), hl.dsp.window.close())
hl.bind(ft("MAIN + SHIFT + Q"), hl.dsp.exec_cmd("uwsm stop"))
hl.bind(ft("MAIN + SHIFT + space"), hl.dsp.window.float())
hl.bind(ft("MAIN + I"), hl.dsp.window.pseudo())
hl.bind(ft("MAIN + SHIFT + J"), hl.dsp.layout("togglesplit"))
hl.bind(ft("MAIN + F11"), hl.dsp.window.fullscreen())
hl.bind(ft("MAIN + S"), hl.dsp.group.toggle())
hl.bind(ft("MAIN + P"), hl.dsp.window.pin())

local arrows = { up = "u", down = "d", left = "l", right = "r" }

for key, code in pairs(arrows) do
	hl.bind(ft("MAIN + " .. key), hl.dsp.focus({ direction = code }))
	hl.bind(ft("MAIN + SHIFT + " .. key), hl.dsp.window.move({ direction = code }))
end

hl.bind(ft("MAIN + SHIFT + D"), hl.dsp.window.resize({ x = 10, y = 0 }), { repeating = true, locked = true })
hl.bind(ft("MAIN + SHIFT + A"), hl.dsp.window.resize({ x = -1, y = 0 }), { repeating = true, locked = true })
hl.bind(ft("MAIN + SHIFT + W"), hl.dsp.window.resize({ x = 0, y = -10 }), { repeating = true, locked = true })
hl.bind(ft("MAIN + SHIFT + S"), hl.dsp.window.resize({ x = 0, y = 10 }), { repeating = true, locked = true })

hl.bind(ft("MAIN + TAB"), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(ft("MAIN + SHIFT + TAB"), hl.dsp.focus({ workspace = "e-1" }))
hl.bind(ft("MAIN + mouse_down"), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(ft("MAIN + mouse_up"), hl.dsp.focus({ workspace = "e-1" }))

hl.bind(ft("MAIN + mouse:272"), hl.dsp.window.drag(), { mouse = true })
hl.bind(ft("MAIN + mouse:273"), hl.dsp.window.resize(), { mouse = true })

hl.bind(ft("MAIN + W"), hl.dsp.exec_cmd(M.browser))
hl.bind(ft("MAIN + D"), hl.dsp.exec_cmd("walker"))
hl.bind("XF86Search", hl.dsp.exec_cmd("walker"))
hl.bind(ft("MAIN + return"), hl.dsp.exec_cmd(M.terminal))
hl.bind(ft("MAIN + O"), hl.dsp.exec_cmd("nwg-look"))
hl.bind(ft("MAIN + F"), hl.dsp.exec_cmd(M.explorer))

local function script(name)
	return M.scripts_path .. "/" .. name
end

hl.bind(ft("MAIN + C"), hl.dsp.exec_cmd(script("glaunch.sh")))
hl.bind(ft("MAIN + SHIFT +C"), hl.dsp.exec_cmd(script("code-launch.sh")))
hl.bind(ft("MAIN + SHIFT + Print"), hl.dsp.exec_cmd(script("flameshot.sh gui")))
hl.bind("Print", hl.dsp.exec_cmd(script("flameshot.sh screen")))
hl.bind(ft("MAIN + SHIFT + Delete"), hl.dsp.exec_cmd(script("hibernate.sh")))
hl.bind(ft("MAIN + R"), hl.dsp.exec_cmd(script("reboot.sh")))
hl.bind(ft("MAIN + SHIFT + P"), hl.dsp.exec_cmd("poweroff.sh"))
hl.bind(ft("MAIN + H"), hl.dsp.exec_cmd("btop.sh"))
hl.bind(ft("MAIN + SHIFT + B"), hl.dsp.exec_cmd(script("toggle_bluetooth.sh")))
hl.bind(ft("MAIN + V"), hl.dsp.exec_cmd("copyq toggle"))
hl.bind(ft("MAIN + N"), hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind("XF86Calculator", hl.dsp.exec_cmd("qalculate-gtk"))
hl.bind(ft("MAIN + E"), hl.dsp.exec_cmd(script("toggle-waybar.sh")))
hl.bind(ft("MAIN + L"), hl.dsp.exec_cmd("gtklock"))

hl.bind(ft("MAIN + SHIFT + H"), function()
	hl.dispatch(hl.dsp.focus({ workspace = "special" }))
	hl.exec_cmd(script("btop.sh"))
end)

hl.bind(ft("MAIN + apostrophe"), hl.dsp.focus({ workspace = "special" }))
hl.bind(ft("MAIN + SHIFT + return"), function()
	hl.dispatch(hl.dsp.focus({ workspace = "special" }))
	hl.exec_cmd("kitty --class 'Special Term'")
end)

for i = 1, 10 do
	local key = i % 10
	hl.bind(ft("MAIN + " .. key), hl.dsp.focus({ workspace = i }))
	hl.bind(ft("MAIN + SHIFT +" .. key), hl.dsp.window.move({ workspace = i }))
end

local numpad_workspaces = {
	[87] = 11,
	[88] = 12,
	[89] = 13,
	[83] = 14,
	[84] = 15,
	[85] = 16,
	[79] = 17,
	[80] = 18,
	[81] = 19,
	[90] = 20,
}

for code, workspace in pairs(numpad_workspaces) do
	hl.bind(ft("MAIN + code:" .. code), hl.dsp.focus({ workspace = workspace }))
	hl.bind(ft("MAIN + SHIFT + code:" .. code), hl.dsp.window.move({ workspace = workspace }))
end

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("amixer set Master 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("amixer set Master 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("amixer set Master toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("amixer set Capture toggle"), { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 10%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"), { repeating = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, release = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, release = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, release = true })
