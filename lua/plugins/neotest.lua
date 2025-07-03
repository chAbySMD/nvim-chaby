return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"marilari88/neotest-vitest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-vitest"),
			},
		})

		vim.keymap.set("n", "<leader>tt", "<Cmd>Neotest run<CR>", { noremap = true, silent = true })
	end,

	keys = {
		{ "<leader>tt", "<cmd>Neotest run<CR>", desc = "Neotest run closest" },
		{ "<leader>tf", "<cmd>Neotest run file<CR>", desc = "Neotest run file" },
		{ "<leader>tl", "<cmd>Neotest output<CR>", desc = "Neotest output" },
	},
}
