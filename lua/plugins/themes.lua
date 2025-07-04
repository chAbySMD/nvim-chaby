return {
	-- "folke/tokyonight.nvim",
	-- config = function()
	-- 	require("tokyonight").setup({
	-- 		transparent = true,
	--
	-- 		styles = {
	-- 			sidebars = "transparent",
	-- 			floats = "transparent",
	-- 		}
	-- 	})
	-- end,
	"catppuccin/nvim",
	config = function ()

		require("catppuccin").setup({
			flavour = "frappe",
			transparent_background = true
		})

		vim.cmd.colorscheme "catppuccin"
	end
}
