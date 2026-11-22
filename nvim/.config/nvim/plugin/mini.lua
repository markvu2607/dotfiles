Config.now(function()
	vim.cmd("colorscheme miniautumn")
end)

Config.now(function()
	require("mini.basics").setup()
end)

Config.now(function()
	require("mini.notify").setup()
end)

Config.now(function()
	require("mini.starter").setup()
end)

Config.now(function()
	require("mini.statusline").setup()
end)

Config.now(function()
	require("mini.tabline").setup()
end)

Config.now(function()
	require("mini.files").setup({ windows = { preview = true } })
end)

Config.now(function()
	local misc = require("mini.misc")
	misc.setup()
	misc.setup_auto_root()
	misc.setup_restore_cursor()
	misc.setup_termbg_sync()
end)

Config.later(function()
	require("mini.extra").setup()
end)

Config.later(function()
	local ai = require("mini.ai")
	ai.setup({
		custom_textobjects = {
			F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
			c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
			o = ai.gen_spec.treesitter({
				a = { "@block.outer", "@conditional.outer", "@loop.outer" },
				i = { "@block.inner", "@conditional.inner", "@loop.inner" },
			}),
		},
	})
end)

Config.later(function()
	require("mini.align").setup()
end)

Config.later(function()
	require("mini.bracketed").setup()
end)

Config.later(function()
	require("mini.bufremove").setup()
end)

Config.later(function()
	local miniclue = require("mini.clue")
	miniclue.setup({
		clues = {
			Config.leader_group_clues,
			miniclue.gen_clues.builtin_completion(),
			miniclue.gen_clues.g(),
			miniclue.gen_clues.marks(),
			miniclue.gen_clues.registers(),
			miniclue.gen_clues.square_brackets(),
			miniclue.gen_clues.windows(),
			miniclue.gen_clues.z(),
		},
		triggers = {
			{ mode = { "n", "x" }, keys = "<Leader>" },
			{ mode = "n", keys = "[" },
			{ mode = "n", keys = "]" },
			{ mode = { "n", "x" }, keys = "g" },
			{ mode = { "n", "x" }, keys = "'" },
			{ mode = { "n", "x" }, keys = "`" },
			{ mode = { "n", "x" }, keys = '"' },
			{ mode = { "i", "c" }, keys = "<C-r>" },
			{ mode = "n", keys = "<C-w>" },
			{ mode = { "n", "x" }, keys = "z" },
			{ mode = "i", keys = "<C-x>" },
		},
	})
end)

Config.later(function()
	require("mini.cmdline").setup()
end)

Config.later(function()
	require("mini.comment").setup()
end)

Config.later(function()
	require("mini.completion").setup()
end)

Config.later(function()
	require("mini.diff").setup()
end)

Config.later(function()
	require("mini.git").setup()
end)

Config.later(function()
	require("mini.indentscope").setup()
end)

Config.later(function()
	require("mini.input").setup()
end)

Config.later(function()
	require("mini.jump").setup()
end)

Config.later(function()
	require("mini.jump2d").setup()
end)

Config.later(function()
	require("mini.map").setup()
end)

Config.later(function()
	require("mini.move").setup()
end)

Config.later(function()
	require("mini.pairs").setup()
end)

-- Đặt sau mini.pairs để <CR>/<BS> của mini.keymap không bị mini.pairs ghi đè
Config.later(function()
	require("mini.keymap").setup()
	local map_multistep = require("mini.keymap").map_multistep
	map_multistep("i", "<Tab>", { "pmenu_next" })
	map_multistep("i", "<S-Tab>", { "pmenu_prev" })
	map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
	map_multistep("i", "<BS>", { "minipairs_bs" })
end)

Config.later(function()
	require("mini.pick").setup()
end)

Config.later(function()
	require("mini.splitjoin").setup()
end)

Config.later(function()
	require("mini.surround").setup()
end)

Config.later(function()
	require("mini.trailspace").setup()
end)

-- Tạm tắt vì chưa gắn keymap <Leader>v (bỏ comment khi dùng quản lý file hay mở theo tần suất):
-- Config.later(function()
-- 	require("mini.visits").setup()
-- end)
