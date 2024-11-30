return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			scss = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
		},

		format_on_save = {
			timeout_ms = 100,
			lsp_format = "fallback",
		},
	},
}
