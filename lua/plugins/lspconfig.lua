return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },

		opts = {
			servers = {
				lua_ls = {},
				ts_ls = {
					init_options = {
						plugins = {
							{
								name = "@vue/typescript-plugin",
								location = "/usr/lib/node_modules/@vue/typescript-plugin",
								languages = { "vue" },
							},
						},
					},
					filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
				},
				volar = {},
				tailwindcss = {},
				cssls = {},
				html = {},
				jdtls = {},
				pyright = {},
				elixirls = {
					cmd = { "/home/chaby/.local/share/nvim-chaby/mason/packages/elixir-ls/language_server.sh" },
					filetypes = { "elixir", "eelixir", "heex" },
					settings = {
						elixirLS = {
							dialyzerEnabled = true,
							fetchDeps = true,
							suggestSpecs = true,
						},
					},
				},
			},
		},

		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},
}
