Config.later(function()
	require("conform").setup({
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofmt" },
			rust = { "rustfmt" },
			python = { "ruff_organize_imports", "ruff_format" },
			javascript = { "oxfmt" },
			typescript = { "oxfmt" },
			javascriptreact = { "oxfmt" },
			typescriptreact = { "oxfmt" },
			json = { "oxfmt" },
			jsonc = { "oxfmt" },
			css = { "oxfmt" },
			html = { "oxfmt" },
			yaml = { "oxfmt" },
			markdown = { "oxfmt" },
		},
	})
end)
