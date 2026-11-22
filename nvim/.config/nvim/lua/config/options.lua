vim.g.mapleader = " "

-- UI
vim.o.mouse = "a"
vim.o.switchbuf = "usetab"
vim.o.undofile = true

-- Edit
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.infercase = true
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.spelloptions = "camel"
vim.o.tabstop = 2

-- Built-in completion
vim.o.complete = "."
vim.o.completeopt = "menuone,noselect,fuzzy"
vim.o.completetimeout = 100

Config.later(function()
	vim.diagnostic.config({
		signs = {
			priority = 9999,
			severity = { min = vim.diagnostic.severity.WARN, max = vim.diagnostic.severity.ERROR },
		},
		underline = { severity = { min = vim.diagnostic.severity.HINT, vim.diagnostic.severity.ERROR } },
		virtual_lines = false,
		virtual_text = {
			current_line = true,
			severity = { min = vim.diagnostic.severity.ERROR, max = vim.diagnostic.severity.ERROR },
		},
		update_in_insert = false,
	})
end)
