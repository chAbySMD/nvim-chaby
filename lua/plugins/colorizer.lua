local dev = false

local opts = {
	filetypes = {
		"*",
		"!dashboard",
		go = {
			names_opts = {
				uppercase = false,
				camelcase = false,
			},
			names = false,
		},
		ps1 = {
			RGB = false,
			css = false,
		},
		typescript = {
			css = true,
		},
		javascript = {
			css = false,
		},
		json = {
			css = false,
		},
		sh = {
			css = false,
		},
		mason = {
			css = false,
		},
		lazy = {
			RGB = false,
			css = false,
		},
		cmp_menu = {
			tailwind = "normal",
			always_update = true,
			css = true,
		},
		cmp_docs = {
			always_update = true,
			css = true,
		},
		TelescopeResults = {
			RGB = false,
		},
		markdown = {
			RGB = false,
			RRGGBB = true,
			always_update = true,
		},
		checkhealth = {
			names = false,
		},
		sshconfig = {
			names = false,
		},
		NeogitLogView = {
			RGB = false,
		},
		NeogitStatus = {
			RGB = false,
		},
		Mason = {
			names = false,
		},
		make = {
			names = false,
		},
		templ = {
			tailwind = "both",
		},
	},
	buftypes = {
		"*",
		"!prompt",
		"!popup",
	},
	user_default_options = {
		names_opts = {
			lowercase = true,
			camelcase = true,
			uppercase = true,
			strip_digits = false,
		},
		names = true,
		RGB = true,
		RGBA = true,
		RRGGBB = true,
		RRGGBBAA = true,
		AARRGGBB = true,
		rgb_fn = true,
		hsl_fn = true,
		css = true,
		css_fn = true,
		mode = "background",
		tailwind = true,
		virtualtext_inline = false,
		sass = {
			enable = true,
			parsers = { "css" },
		},
		virtualtext = "■",
		virtualtext_mode = "background",
		always_update = false,
		-- hooks = {
		--   do_parse_line = function(line, line_nr, bufnr)
		--     local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
		--     local is_comment = is_comment_on_line(line_nr, bufnr, filetype)
		--     return not is_comment
		--     -- return string.sub(line, 1, 2) ~= "--"
		--   end,
		-- },
	},
	user_commands = true,
	lazy_load = false,
}

local plugin = {
	opts = opts,
	event = "BufReadPre",
	-- event = "VeryLazy",
	init = function()
		vim.api.nvim_create_autocmd({ "BufReadPre" }, {
			group = vim.api.nvim_create_augroup("ColorizerReloadOnSave", { clear = true }),
			pattern = { "expect.lua" },
			callback = function(evt)
				require("colorizer").reload_on_save(evt.match)
			end,
		})
	end,
	enabled = true,
}

return dev and vim.tbl_extend("keep", plugin, {
	dir = "~/git/nvim-colorizer.lua",
}) or vim.tbl_extend("keep", plugin, {
	"catgoose/nvim-colorizer.lua",
})
