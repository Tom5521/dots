local function curv(bezier_name, p1, p2, p3, p4)
	hl.curve(bezier_name, {
		type = "bezier",
		points = { { p1, p2 }, { p3, p4 } },
	})
end

local function anim(leaf, enabled, speed, bezier, ...)
	hl.animation({
		leaf = leaf,
		speed = speed,
		bezier = bezier,
		enabled = enabled == 1,
		style = ...,
	})
end

curv("myBezier", 0.05, 0.9, 0.1, 1.05)
curv("WinIn", 0.6, 0.7, 0.1, 1.19)
curv("WinOut", 0.36, 0, 0.66, -0.56)

anim("windows", 1, 7, "myBezier")
anim("windowsIn", 1, 5, "default", "popin 20%")
anim("windowsOut", 1, 10, "default", "popin 10%")
anim("border", 1, 10, "default")
anim("borderangle", 1, 8, "default")
anim("fade", 1, 13, "default")
anim("fadeIn", 1, 10, "WinIn")
anim("workspaces", 1, 6, "default", "slidefade 20%")
anim("windowsMove", 1, 5, "WinIn")
