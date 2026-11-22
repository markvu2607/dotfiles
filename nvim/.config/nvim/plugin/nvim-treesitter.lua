Config.now(function()
	Config.new_autocmd("FileType", "*", function(args)
		local lang = vim.treesitter.language.get_lang(args.match)
		if lang and pcall(vim.treesitter.start, args.buf, lang) then
			vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end, "Start tree-sitter highlight and indent")
end)

Config.later(function()
	local languages = {
		"bash",
		"c",
		"cpp",
		"css",
		"fish",
		"go",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"rust",
		"toml",
		"tsx",
		"typescript",
		"yaml",
	}

	local isnt_installed = function(lang)
		return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
	end
	local to_install = vim.tbl_filter(isnt_installed, languages)
	if #to_install > 0 and vim.fn.executable("tree-sitter") == 1 then
		require("nvim-treesitter").install(to_install)
	end

	Config.on_packchanged("nvim-treesitter", { "update" }, function()
		vim.cmd("TSUpdate")
	end, "Update tree-sitter parsers")
end)
