local later = Config.later

later(function()
	vim.lsp.enable({
		"lua_ls",
	})
end)
