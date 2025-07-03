return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"css",
			"javascript",
			"vue",
			"md",
			"html",
			"lua",
		})
	end,
}
