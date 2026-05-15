return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      ltex_plus = {
        settings = {
          ltex = {
            language = "es",
            checkFrequency = "save",
          },
        },
      },
      gopls = {
        settings = {
          gopls = {
            usePlaceholders = false,
          },
        },
      },
    },
  },
}
