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
		config = {
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
