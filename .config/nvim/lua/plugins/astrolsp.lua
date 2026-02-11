return {
	"AstroNvim/astrolsp",
	---@type AstroLSPOpts
	opts = {
		--[[ 		mason_lspconfig = {
			servers = {
				just = {
					package = "just-lsp",
					filetypes = { "just" },
				},
			},
		}, ]]
		servers = {
			ltex = {
				settings = {
					ltex = {
						language = "auto",
					},
				},
			},
		},
	},
}
