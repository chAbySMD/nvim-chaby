return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		vim.keymap.set('n', '<leader>e', "<Cmd>NvimTreeToggle<CR>", { desc = "Nvim Tree Window" })

		require("nvim-tree").setup {
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 38,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		}

		local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
		vim.api.nvim_create_autocmd("User", {
			pattern = "NvimTreeSetup",
			callback = function()
				local events = require("nvim-tree.api").events
				events.subscribe(events.Event.NodeRenamed, function(data)
					if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
						data = data
						Snacks.rename.on_rename_file(data.old_name, data.new_name)
					end
				end)
			end,
		})
	end,

	opts = {
		filters = { dotfiles = false },
		disable_netrw = true,
		hijack_cursor = true,
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = false,
		},
		view = {
			width = 30,
			preserve_window_proportions = true,
		},
		renderer = {
			root_folder_label = false,
			highlight_git = true,
			indent_markers = { enable = true },
			icons = {
				glyphs = {
					default = "󰈚",
					folder = {
						default = "",
						empty = "",
						empty_open = "",
						open = "",
						symlink = "",
					},
					git = { unmerged = "" },
				},
			},
		},
	}
}
