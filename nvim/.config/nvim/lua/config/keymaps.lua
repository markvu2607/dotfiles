local nmap_leader = function(suffix, rhs, desc)
	vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
end
local xmap_leader = function(suffix, rhs, desc)
	vim.keymap.set("x", "<Leader>" .. suffix, rhs, { desc = desc })
end

-- Buffer
nmap_leader("bd", "<Cmd>lua MiniBufremove.delete()<CR>", "Delete")

-- Explore/Edit
nmap_leader("ed", "<Cmd>lua MiniFiles.open()<CR>", "Directory")
nmap_leader("ef", "<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", "File directory")
nmap_leader("en", "<Cmd>lua MiniNotify.show_history()<CR>", "Notifications")

-- Find
nmap_leader("ff", "<Cmd>Pick files<CR>", "Files")
nmap_leader("fD", '<Cmd>Pick diagnostic scope="all"<CR>', "Diagnostic workspace")
nmap_leader("fd", '<Cmd>Pick diagnostic scope="current"<CR>', "Diagnostic buffer")
nmap_leader("fb", "<Cmd>Pick buffers<CR>", "Buffers")
nmap_leader("fg", "<Cmd>Pick grep_live<CR>", "Grep live")
nmap_leader("fG", '<Cmd>Pick grep pattern="<cword>"<CR>', "Grep current word")
nmap_leader("fR", '<Cmd>Pick lsp scope="references"<CR>', "References (LSP)")
nmap_leader("fs", '<Cmd>Pick lsp scope="workspace_symbol_live"<CR>', "Symbols workspace (live)")
nmap_leader("fS", '<Cmd>Pick lsp scope="document_symbol"<CR>', "Symbols document")

-- Git
nmap_leader("gd", "<Cmd>Git diff<CR>", "Diff")
nmap_leader("gD", "<Cmd>Git diff -- %<CR>", "Diff buffer")
nmap_leader("go", "<Cmd>lua MiniDiff.toggle_overlay()<CR>", "Toggle overlay")
nmap_leader("gs", "<Cmd>lua MiniGit.show_at_cursor()<CR>", "Show at cursor")

-- LSP
nmap_leader("la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Actions")
xmap_leader("la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Actions")
nmap_leader("ld", "<Cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostic popup")
nmap_leader("lf", "<Cmd>lua require('conform').format()<CR>", "Format")
xmap_leader("lf", "<Cmd>lua require('conform').format()<CR><Esc>", "Format")
nmap_leader("lh", "<Cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", "Inlay hints (toggle)")
nmap_leader("li", "<Cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation")
nmap_leader("ll", "<Cmd>lua vim.lsp.codelens.run()<CR>", "Lens")
nmap_leader("lr", "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename")
nmap_leader("lR", "<Cmd>lua vim.lsp.buf.references()<CR>", "References")
nmap_leader("ls", "<Cmd>lua vim.lsp.buf.definition()<CR>", "Source definition")
nmap_leader("lt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition")

-- Map
nmap_leader("mf", "<Cmd>lua MiniMap.toggle_focus()<CR>", "Focus (toggle)")
nmap_leader("mr", "<Cmd>lua MiniMap.refresh()<CR>", "Refresh")
nmap_leader("ms", "<Cmd>lua MiniMap.toggle_side()<CR>", "Side (toggle)")
nmap_leader("mt", "<Cmd>lua MiniMap.toggle()<CR>", "Toggle")

-- Terminal
nmap_leader("tt", "<Cmd>horizontal term<CR>", "Terminal (H)")
nmap_leader("tT", "<Cmd>vertical term<CR>", "Terminal (V)")
