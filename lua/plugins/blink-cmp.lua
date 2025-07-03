return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.1.1",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",

			["<CR>"] = { "accept", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<C-space>"] = {
				function(cmp)
					cmp.show({ providers = { "snippets", "lsp" } })
				end,
			},
		},

		appearance = {
			nerd_font_variant = "normal",
		},

		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 250,
				window = {
					border = "rounded",
				},
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},
			menu = {
				enabled = true,
				border = "rounded",
				draw = {
					padding = 1,
				},
			},
		},

		cmdline = {
			enabled = true,
			keymap = {
				preset = "none",

				["<Tab>"] = { "show_and_insert", "select_next" },
				["<S-Tab>"] = { "show_and_insert", "select_prev" },
				["<CR>"] = { "accept", "fallback" },
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
