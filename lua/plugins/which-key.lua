return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix", -- Стиль отображения (modern, classic, helix)
		delay = 250,      -- Задержка перед показом (в миллисекундах)
		win = {
			border = "single", -- Граница окна (none, single, double, shadow)
		},
		layout = {
			align = "center",
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
	end,
}
