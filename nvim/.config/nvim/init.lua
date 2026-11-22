-- Triết lý cấu hình: ưu tiên tối đa Native Neovim + mini.nvim,
-- hạn chế tối đa plugin và công cụ CLI bên ngoài (xem README.md).
vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/stevearc/conform.nvim",
})

require("config.global-config")
require("config.options")
require("config.keymaps")
require("config.autocmds")
