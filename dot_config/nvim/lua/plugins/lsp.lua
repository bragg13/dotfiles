return {
	-- tools
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"stylua",
				"selene",
				"luacheck",
				"shellcheck",
				"shfmt",
				"tailwindcss-language-server",
				"typescript-language-server",
				"css-lsp",
			})
		end,
	},

	-- lsp servers
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
			servers = {
				marksman = {
					enabled = false,
				},
				cssls = {},
				tailwindcss = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
				},
				tsserver = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
					single_file_support = false,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
				html = {},
				yamlls = {
					settings = {
						yaml = {
							keyOrdering = false,
						},
					},
				},
				lua_ls = {
					-- enabled = false,
					single_file_support = true,
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								workspaceWord = true,
								callSnippet = "Both",
							},
							misc = {
								parameters = {
									-- "--log-level=trace",
								},
							},
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
							doc = {
								privateName = { "^_" },
							},
							type = {
								castNumberToInteger = true,
							},
							diagnostics = {
								disable = { "incomplete-signature-doc", "trailing-space" },
								-- enable = false,
								groupSeverity = {
									strong = "Warning",
									strict = "Warning",
								},
								groupFileStatus = {
									["ambiguity"] = "Opened",
									["await"] = "Opened",
									["codestyle"] = "None",
									["duplicate"] = "Opened",
									["global"] = "Opened",
									["luadoc"] = "Opened",
									["redefined"] = "Opened",
									["strict"] = "Opened",
									["strong"] = "Opened",
									["type-check"] = "Opened",
									["unbalanced"] = "Opened",
									["unused"] = "Opened",
								},
								unusedLocalExclude = { "_*" },
							},
							format = {
								enable = false,
								defaultConfig = {
									indent_style = "space",
									indent_size = "4",
									continuation_indent_size = "4",
								},
							},
						},
					},
				},
			},
			setup = {},
		},
	},
	-- {
	-- 	"jose-elias-alvarez/null-ls.nvim",
	-- 	config = function()
	-- 		local null_ls = require("null-ls")
	--
	-- 		local root_has_file = function(files)
	-- 			return function(utils)
	-- 				return utils.root_has_file(files)
	-- 			end
	-- 		end
	--
	-- 		local eslint_root_files = { ".eslintrc", ".eslintrc.js", ".eslintrc.json" }
	-- 		local prettier_root_files = { ".prettierrc", ".prettierrc.js", ".prettierrc.json" }
	-- 		local stylua_root_files = { "stylua.toml", ".stylua.toml" }
	-- 		local elm_root_files = { "elm.json" }
	--
	-- 		local opts = {
	-- 			eslint_formatting = {
	-- 				condition = function(utils)
	-- 					local has_eslint = root_has_file(eslint_root_files)(utils)
	-- 					local has_prettier = root_has_file(prettier_root_files)(utils)
	-- 					return has_eslint and not has_prettier
	-- 				end,
	-- 			},
	-- 			eslint_diagnostics = {
	-- 				condition = root_has_file(eslint_root_files),
	-- 			},
	-- 			prettier_formatting = {
	-- 				condition = root_has_file(prettier_root_files),
	-- 			},
	-- 			stylua_formatting = {
	-- 				condition = root_has_file(stylua_root_files),
	-- 			},
	-- 			elm_format_formatting = {
	-- 				condition = root_has_file(elm_root_files),
	-- 			},
	-- 		}
	--
	-- 		local function on_attach(client, _)
	-- 			if client.server_capabilities.document_formatting then
	-- 				vim.cmd("command! -buffer Formatting lua vim.lsp.buf.formatting()")
	-- 				vim.cmd("command! -buffer FormattingSync lua vim.lsp.buf.formatting_sync()")
	-- 			end
	-- 		end
	--
	-- 		null_ls.setup({
	-- 			sources = {
	-- 				null_ls.builtins.diagnostics.eslint_d.with(opts.eslint_diagnostics),
	-- 				null_ls.builtins.formatting.eslint_d.with(opts.eslint_formatting),
	-- 				null_ls.builtins.formatting.prettier.with(opts.prettier_formatting),
	-- 				null_ls.builtins.formatting.stylua.with(opts.stylua_formatting),
	-- 				null_ls.builtins.formatting.elm_format.with(opts.elm_format_formatting),
	-- 				null_ls.builtins.code_actions.eslint_d.with(opts.eslint_diagnostics),
	-- 			},
	-- 			on_attach = on_attach,
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	require("null-ls").setup({
	-- 		sources = {},
	-- 		on_attach = function(client)
	-- 			if client.server_capabilities.document_formatting then
	-- 				client.server_capabilities.document_formatting = false
	-- 			end
	-- 			if client.server_capabilities.document_range_formatting then
	-- 				client.server_capabilities.document_range_formatting = false
	-- 			end
	-- 		end,
	-- 	}),
	-- },
}
