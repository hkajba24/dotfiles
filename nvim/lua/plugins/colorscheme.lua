return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
      })
    end,
  },

  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanso").setup({
        background = {
          light = "pearl",
          dark = "ink",
        },
      })
    end,
  },

  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("material").setup({
        disable = {
          background = true,
        },
        lualine_style = "stealth",
      })
      vim.g.material_style = "darker"
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material",
    },
  },
}
