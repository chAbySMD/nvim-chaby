return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for v0.4.0+
		"nvim-tree/nvim-web-devicons", -- If you want devicons
	},
	config = function()
		local map = vim.api.nvim_set_keymap

		map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {
			silent = true,
		})
		map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {
			silent = true,
		})

		require("bufferline").setup({
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						separator = true,
						text = "File explorer",
						text_align = "center",
					},
				},
			},
		})
	end,
}
