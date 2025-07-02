return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"golangci-lint",
				"golines",
				"gofumpt",
				"stylua",
				"tree-sitter-cli",

				-- Latex utilities.
				"ltex-ls",
				"ltex-ls-plus",
				"texlab",
				"tectonic",
				"just-lsp",
			},
		},
	},
}
