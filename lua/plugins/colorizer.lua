return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"javascript",
			"vue",
			"md",
			"html",
			"lua",
			css = {
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
			},
		})
	end,
}
