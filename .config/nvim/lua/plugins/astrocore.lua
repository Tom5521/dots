return {
	"AstroNvim/astrocore",
	opts = {
		-- Configure core features of AstroNvim
		features = {
			large_buf = { size = 1024 * 256, lines = 10000 },          -- set global limits for large files for disabling features like treesitter
			autopairs = true,                                          -- enable autopairs at start
			cmp = true,                                                -- enable completion at start
			diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
			highlighturl = true,                                       -- highlight URLs at start
			notifications = true,                                      -- enable notifications at start
		},
		diagnostics = {
			virtual_text = true,
			underline = true,
		},
		options = {
			opt = {
				relativenumber = false, -- sets vim.opt.relativenumber
				number = true,      -- sets vim.opt.number
				spell = false,      -- sets vim.opt.spell
				signcolumn = "yes", -- sets vim.opt.signcolumn to yes
				wrap = true,        -- sets vim.opt.wrap
			},
		},
		mappings = {},
	},
}
