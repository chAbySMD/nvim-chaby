return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local ls = require("luasnip")
		ls.filetype_extend("javascript", { "html" })
		ls.filetype_extend("typescript", { "html" })
		ls.filetype_extend("javascriptreact", { "html" })
		ls.filetype_extend("typescriptreact", { "html" })
		ls.filetype_extend("vue", { "html" })

		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
