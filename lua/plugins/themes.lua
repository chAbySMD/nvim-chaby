return {
	{
		"navarasu/onedark.nvim",
		opts = {
			transparent = true,
		},
	},
	{
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
		end,
	},
	"folke/tokyonight.nvim",
}
