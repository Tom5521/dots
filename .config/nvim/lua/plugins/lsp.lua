return {
  "neovim/nvim-lspconfig",
  opts = {
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
