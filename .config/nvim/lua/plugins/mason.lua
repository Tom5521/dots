return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- GNU/Make
        "mbake",
        -- General
        "tree-sitter-cli",

        -- Lua
        "lua-language-server",
        "stylua",

        -- Go
        "golangci-lint",
        "golines",
        "gofumpt",
        "gomodifytags",
        "gci",
        "delve",
        -- "revive",
        "impl",
        "iferr",
        "gopls",
        "nilaway",

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
