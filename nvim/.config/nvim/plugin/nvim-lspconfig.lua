local later = Config.later

-- Tự động bật LSP nào thực sự có binary trong PATH (host hoặc distrobox hiện tại)
local servers = {
	lua_ls = "lua-language-server",
	gopls = "gopls",
	rust_analyzer = "rust-analyzer",
	tsc = "tsc",
	oxlint = "oxlint",
	ty = "ty",
	ruff = "ruff",
}

later(function()
	local enabled = {}
	for server, bin in pairs(servers) do
		if vim.fn.executable(bin) == 1 then
			table.insert(enabled, server)
		end
	end

	if #enabled > 0 then
		vim.lsp.enable(enabled)
	end
end)
