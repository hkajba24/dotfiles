-- MAIN INIT FILE

-- set global map leader
vim.g.mapleader = " "
-- display line numbers
vim.opt.number = true
--display relative line numbers
vim.opt.relativenumber = true
-- enable 24-bit RGB colors
vim.opt.termguicolors = true
-- number of spaces that a tab counts as
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- helper function to shorten github links
local gh = function(x) return "https://github.com/" .. x end

-- load colorscheme and plugin that syncs it with system theme
vim.pack.add({
	{ src = gh("projekt0n/github-nvim-theme") },
	{ src = gh("afonsofrancof/OSC11.nvim") },
})

-- customize colorscheme
require("github-theme").setup({
	options = { transparent = true }
})

-- set colorscheme, adjust based on system theme
do
	local function set_dark()
		vim.o.background = "dark"
		vim.cmd.colorscheme("github_dark_dimmed")
	end

	local function set_light()
		vim.o.background = "light"
		vim.cmd.colorscheme("github_light")
	end

	if vim.o.background == "light" then
		set_light()
	else
		set_dark()
	end

	require("osc11").setup({
		on_dark = set_dark,
		on_light = set_light,
	})
end

-- load treesitter
vim.pack.add({
	{ src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
})

-- install needed packages for LSP
vim.pack.add({
	{ src = gh("neovim/nvim-lspconfig") },
	{ src = gh("mason-org/mason.nvim") },
	{ src = gh("mason-org/mason-lspconfig.nvim") },
	{ src = gh("WhoIsSethDaniel/mason-tool-installer.nvim") },
})

require("mason").setup({})
require("mason-lspconfig").setup({})
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"clangd",
		"basedpyright",
		"ruff",
	}
})

vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("stylua")
vim.lsp.enable("basedpyright")
vim.lsp.enable("ruff")

-- enable autocompletion and autopairing plugins
vim.pack.add({
	{ src = gh("saghen/blink.cmp"), version = "v1" },
	{ src = gh("nvim-mini/mini.pairs"), version = "stable" },
})
require("blink.cmp").setup({
	keymap = {
		preset = "super-tab"
	}
})
require("mini.pairs").setup({})

-- install fuzzy finder
vim.pack.add({
	{ src = gh("nvim-tree/nvim-web-devicons") },
	{ src = gh("ibhagwan/fzf-lua") },
})

-- set fuzzy finder keybinds
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", {buffer = 0})
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", {buffer = 0})

-- install lualine
vim.pack.add({
	{ src = gh("nvim-lualine/lualine.nvim") },
})

require("lualine").setup({
	options = {
		theme = "auto",
	}
})

