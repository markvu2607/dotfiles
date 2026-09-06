vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.timeoutlen = 500

-- Remove default behavior of <Space> in normal and visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins using lazy.nvim
require("lazy").setup({
	-- [mini.surround]: Thao tác bao quanh ký tự (ngoặc đơn, ngoặc kép)
	{
		"echasnovski/mini.surround",
		version = "*",
		opts = {},
	},

	-- [mini.ai]: Nâng cấp Text Objects cực mạnh (Chọn hàm, chọn tham số)
	{
		"echasnovski/mini.ai",
		version = "*",
		opts = { n_lines = 500 },
	},

	-- [mini.comment]: Comment code nhanh chóng
	{ 'echasnovski/mini.comment', version = '*', opts = {} },

	-- [flash.nvim]: Nhảy con trỏ tới bất kỳ vị trí nào trên màn hình
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		},
	},
}, {
	-- Vô hiệu hóa giao diện cài đặt vì chạy ẩn trong VS Code
	ui = { enabled = false },
	defaults = { lazy = false },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin", "netrwPlugin",
			},
		},
	},
})
