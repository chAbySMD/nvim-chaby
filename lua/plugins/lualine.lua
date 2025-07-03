return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local M = {}
		M.theme = function()
			local colors = require("assets.colors")

			return {
				inactive = {
					a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
				visual = {
					a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
				replace = {
					a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
				normal = {
					a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
				insert = {
					a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
				command = {
					a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
			}
		end

		require("lualine").setup {
			options = {
				theme = M.theme(),
			}
		}
	end
}
