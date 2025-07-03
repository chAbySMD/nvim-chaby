return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		lazy = false,
		opts = {
			options = {
				pick = {
					alphabet = "123456789",
				},
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
						padding = 1,
					},
				},
			},
		},
		keys = {
			{ "<Tab>", "<cmd>bnext<CR>", desc = "Next buffer" },
			{ "<S-Tab>", "<cmd>bprev<CR>", desc = "Prev buffer" },
			{ "<leader>e", "<cmd>BufferLinePick<CR>", desc = "Pick buffer" },
			{ "<leader>C", "<cmd>BufferLinePickClose<CR>", desc = "Pick delete buffer" },
			{ "<C-Tab>", "<cmd>tabnext<CR>", desc = "Next tab" },
			{ "<C-S-Tab>", "<cmd>tabprevious<CR>", desc = "Prev tab" },
			{ "<leader>nt", "<cmd>tabnew<CR>", desc = "New tab" },
		},
	},
	{
		"tiagovla/scope.nvim",
		config = function()
			require("scope").setup()
		end,
	},
	{
		"famiu/bufdelete.nvim",
		keys = {
			{ "<leader>c", "<cmd>Bdelete<CR>", desc = "Delete current buffer" },
		},
	},
}
