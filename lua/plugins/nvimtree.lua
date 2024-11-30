return {
	"nvim-tree/nvim-tree.lua",
	config = function ()
		vim.keymap.set('n', '<leader>e', "<Cmd>NvimTreeToggle<CR>", {desc="Open nvim tree"})

		require("nvim-tree").setup {
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		}
	end
}
