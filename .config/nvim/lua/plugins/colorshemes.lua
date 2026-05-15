return {
  {
    "nyoom-engineering/oxocarbon.nvim",
  },
  {
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_style = "default"
      vim.g.sonokai_better_performance = true
      vim.g.sonokai_enable_italic = true
    end,
  },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
  },
  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "cooler",
    },
  },
  {
    "everviolet/nvim",
    name = "evergarden",
    priority = 1000,
    opts = {
      theme = {
        variant = "winter",
        accent = "green",
      },
    },
  },
  {
    "loctvl842/monokai-pro.nvim",
    opts = {
      transparent_background = false,
      filter = "spectrum",
      devicons = true,
      styles = {
        comment = { italic = true },
        keyword = { italic = true }, -- any other keyword
        type = { italic = true, bold = true }, -- (preferred) int, long, char, etc
        storageclass = { italic = true }, -- static, register, volatile, etc
        structure = { italic = true }, -- struct, union, enum, etc
        parameter = { italic = true }, -- parameter pass in function
        annotation = { italic = true },
        tag_attribute = { italic = true }, -- attribute of tag in reactjs
      },
    },
  },
}
