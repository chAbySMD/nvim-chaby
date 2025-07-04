return {
	"akinsho/bufferline.nvim",
	config = function()
		require('bufferline').setup {
			options = {
				separator_style = "thin",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true -- use a "true" to enable the default, or set your own character
					}
				}
			},
			highlights = {
				fill = { bg = "none" },
				background = { bg = "none" },
				buffer_selected = { bg = "none" },
			}
		}
	end
}
