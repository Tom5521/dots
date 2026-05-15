return {
  {
    "LazyVim/LazyVim",
    ---@type LazyVimConfig
    opts = {
      colorscheme = "sonokai",
    },
  },
  {
    "EddyBer16/pseint.vim",
    ft = { "pseint" },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      autochdir = true,
      direction = "float",
    },
  },
  {
    "sphamba/smear-cursor.nvim",
    enabled = not vim.g.neovide,
    opts = {},
  },
  {
    "RaafatTurki/hex.nvim",
    opts = {},
  },
  {
    "mtoohey31/cmp-fish",
    ft = "fish",
  },
  --  {
  --    "Snikimonkd/cmp-go-pkgs",
  --    ft = "go",
  --  },
  {
    "xzbdmw/colorful-menu.nvim",
    lazy = false,
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
    enabled = true,
  },
  {
    "NStefan002/visual-surround.nvim",
    opts = {},
  },
}
