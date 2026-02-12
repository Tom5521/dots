return {
  "AstroNvim/astrolsp",
  opts = {
    features = {
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = true, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
      },
      timeout_ms = 2000, -- default format timeout
    },
    -- enable servers that you already have installed without mason
    servers = {},
    ---@diagnostic disable: missing-fields
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
