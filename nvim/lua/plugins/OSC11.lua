return {
  "afonsofrancof/OSC11.nvim",
  opts = {
    -- Function to call when switching to dark theme
    on_dark = function()
      vim.opt.background = "dark"
      vim.cmd("colorscheme github_dark")
    end,
    -- Function to call when switching to light theme
    on_light = function()
      vim.cmd("colorscheme github_light")
    end,
  },
}
