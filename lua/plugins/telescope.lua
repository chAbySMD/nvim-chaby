return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>fa", "<cmd>Telescope find_files<CR>", desc = "Telescope find files" },
		{ "<leader>fw", "<cmd>Telescope live_grep<CR>", desc = "Telescope live grep" },
	},
	opts = {
		defaults = {
			file_ignore_patterns = {
				"^node_modules/",
				"^.git/",
				"^vendor/",
				"^deps/",
				"^dist/",
				"^build/",
				"^_build/",
				"^release/",
				"^app-release/",
				"^android/",
				"^ios/",
			},
		},
	},
}
