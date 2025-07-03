return {
	"mfussenegger/nvim-lint",
	config = function()
		require('lint').linters_by_ft = {
			javascript = { 'oxlint', 'eslint_d' },
			typescript = { 'oxlint', 'eslint_d' },
			javascriptreact = { 'oxlint', 'eslint_d' },
			typescriptreact = { 'oxlint', 'eslint_d' },
			vue = { 'oxlint', 'eslint_d' },
		}
	end
}
