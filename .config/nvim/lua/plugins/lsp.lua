return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ltex_plus = {
        settings = {
          ltex = {
            language = "es",
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
