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
			miniclue.gen_clues.square_brackets(),
		},
		triggers = {
			{ mode = { "n", "x" }, keys = "<Leader>" },
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
	require("mini.keymap").setup()
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

Config.later(function()
	require("mini.visits").setup()
end)
