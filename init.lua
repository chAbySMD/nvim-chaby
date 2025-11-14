-- Line Numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indent Settings
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Other
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.ignorecase = true
vim.o.smartcase = true

-- Spell
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- Fillchars
vim.opt.fillchars = {
	vert = "│",
	fold = "⠀",
	eob = " ", -- suppress ~ at EndOfBuffer
	-- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		active = true,
		text = {
			[vim.diagnostic.severity.ERROR] = symbols.Error,
			[vim.diagnostic.severity.WARN] = symbols.Warn,
			[vim.diagnostic.severity.HINT] = symbols.Hint,
			[vim.diagnostic.severity.INFO] = symbols.Info,
		},
	},
	underline = true,
})

require("config.lazy")
require("config.mappings")

-- Autostart nvim-tree
vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("NvimTreeAutoOpen", { clear = true }),
	callback = function()
		-- Close any existing nvim-tree instance to avoid duplicates
		require("nvim-tree.api").tree.close()
		-- Open nvim-tree
		require("nvim-tree.api").tree.open()
		vim.cmd([[wincmd l]])
	end,
})

-- Undotree
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/undotemp//") -- Папка для хранения undo-файлов

local undodir = vim.fn.expand("~/undotemp")
if not vim.fn.isdirectory(undodir) then
	vim.fn.mkdir(undodir, "p")
end

vim.cmd([[colorscheme catppuccin-frappe]])

local colors = require("assets.colors")

vim.cmd([[
	highlight Normal guibg=none
	highlight NonText guibg=none
	highlight NonText ctermbg=none
	highlight VertSplit guibg=none guifg=none
	highlight LineNr guibg=none guifg=#303030
	highlight CursorLine guibg=#303030
	highlight WinSeparator guibg=none guifg=#303030
	highlight NvimTreeWinSeparator guibg=none guifg=#202020
	highlight StatusLine guibg=none
	highlight FloatBorder guibg=none
	highlight NormalFloat guibg=none
	highlight Pmenu guibg=none
	highlight SnacksIndent guifg=#303030
	highlight BufferLineFill guibg=none
	highlight BufferLineTab guibg=none
	highlight BufferLineBuffer guibg=none
	highlight BufferLineBufferSelected guibg=none
	highlight BufferLineSeparator guifg=none guibg=none
	highlight BufferLineBackground guibg=none
	highlight BufferLineCloseButton guibg=none
	highlight BufferLineCloseButtonSelected guibg=none
	highlight BufferLineIndicatorSelected guibg=none
]])

vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.normal })
vim.api.nvim_set_hl(0, "FloatTitle", { fg = colors.normal })

vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = colors.normal })
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = colors.normal })
vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg = colors.gray })
vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = colors.darkgray, fg = colors.normal })
vim.api.nvim_set_hl(0, "BlinkCmpScrollBarThumb", { bg = colors.visual })

vim.api.nvim_set_hl(0, "WhichKeyIcon", { fg = colors.visual })
vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = colors.visual })

vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.normal })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = colors.normal })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = colors.normal })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.normal })
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = colors.darkgray })
