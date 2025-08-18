return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },

		opts = {
			servers = {
				lua_ls = {},
				ts_ls = {
					-- init_options = {
					-- 	plugins = {
					-- 		{
					-- 			name = "@vue/typescript-plugin",
					-- 			location = "/usr/lib/node_modules/@vue/typescript-plugin",
					-- 			languages = { "vue" },
					-- 		},
					-- 	},
					-- },
					-- filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
				},
				tailwindcss = {},
				cssls = {},
				html = {},
				jdtls = {},
				pyright = {},
				-- elixirls = {
				-- 	cmd = { "/home/chaby/.local/share/nvim-chaby/mason/packages/elixir-ls/language_server.sh" },
				-- 	filetypes = { "elixir", "eelixir", "heex" },
				-- 	settings = {
				-- 		elixirLS = {
				-- 			dialyzerEnabled = true,
				-- 			fetchDeps = true,
				-- 			suggestSpecs = true,
				-- 		},
				-- 	},
				-- },
				-- lexical = {
				-- 	cmd = { "/home/chaby/bin/lexical/bin/start_lexical.sh" },
				-- },
				qmlls = {},
			},
		},

		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end

			-- Vue
			local vue_language_server_path =
				"/home/chaby/.local/share/nvim-chaby/mason/packages/vue-language-server/node_modules/@vue/language-server"
			local vue_plugin = {
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "vue" },
				configNamespace = "typescript",
			}
			local vtsls_config = {
				settings = {
					vtsls = {
						tsserver = {
							globalPlugins = {
								vue_plugin,
							},
						},
					},
				},
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			}

			local vue_ls_config = {
				on_init = function(client)
					client.handlers["tsserver/request"] = function(_, result, context)
						local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
						if #clients == 0 then
							vim.notify(
								"Could not found `vtsls` lsp client, vue_lsp would not work without it.",
								vim.log.levels.ERROR
							)
							return
						end
						local ts_client = clients[1]

						local param = unpack(result)
						local id, command, payload = unpack(param)
						ts_client:exec_cmd({
							title = "vue_request_forward", -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
							command = "typescript.tsserverRequest",
							arguments = {
								command,
								payload,
							},
						}, { bufnr = context.bufnr }, function(_, r)
							local response_data = { { id, r.body } }
							---@diagnostic disable-next-line: param-type-mismatch
							client:notify("tsserver/response", response_data)
						end)
					end
				end,
			}
			-- nvim 0.11 or above
			vim.lsp.config("vtsls", vtsls_config)
			vim.lsp.config("vue_ls", vue_ls_config)
			vim.lsp.enable({ "vtsls", "vue_ls" })
		end,
	},
}
