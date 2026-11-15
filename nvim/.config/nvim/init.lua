vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/mason-org/mason.nvim",
})

require("config.global-config")
require("config.options")
require("config.keymaps")
require("config.autocmds")
