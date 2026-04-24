return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
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
      override = function(scheme)
        return {}
      end,
      override_palette = function(filter)
        return {}
      end,
      override_scheme = function(scheme, palette, colors)
        return {}
      end,
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
    "jasonccox/vim-wayland-clipboard",
    enabled = require("jit").os == "Linux" and os.getenv("XDG_SESSION_TYPE") == "wayland",
    lazy = false,
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
}
