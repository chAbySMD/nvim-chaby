return {
	"navarasu/onedark.nvim",
	config = function()
		require("onedark").setup({
			transparent = true,
			-- highlights = {
			-- 	FloatBorder = { bg = "#00000000" },
			-- },
		})
	end,
}
