return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"williamboman/mason.nvim",
			dependencies = {
				"williamboman/mason-lspconfig.nvim",
				"WhoIsSethDaniel/mason-tool-installer.nvim",
			},
			config = function()
				require("mason").setup({
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				})

				require("mason-lspconfig").setup({
					automatic_installation = true,
				})
				require("mason-tool-installer").setup({
					ensure_installed = {
						"lua-language-server",
						"stylua",
						"csharpier",
						{ "omnisharp", version = "v1.39.8" },
						-- 'eslint_d',
						"prettierd",
						"vetur-vls",
						"vue-language-server",
						"pyright",
						"isort",
						"black",
						-- 'rust-analyzer',
						-- 'graphql-language-service-cli',
						-- 'prisma-language-server',
					},
				})
			end,
		},
		{
			"folke/neoconf.nvim",
		},
		{
			"Hoffs/omnisharp-extended-lsp.nvim",
		},
		-- {
		-- 	'williamboman/mason-lspconfig.nvim',
		-- 	config = function()
		-- 		require("mason-lspconfig").setup({
		-- 			-- 确保安装，根据需要填写
		-- 			ensure_installed = {
		-- 				"lua_ls",
		-- 				"omnisharp"
		-- 			},
		-- 		})
		-- 	end
		-- }
	},
	config = function()
		require("neoconf").setup({
			-- override any of the default settings here
		})

		local lspconfig = require("lspconfig")

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				local opts = {
					on_attach = require("lsp").on_attach,
					capabilities = require("lsp").capabilities,
				}
				-- print(server_name)
				-- print(require("neoconf").get("lspconfig." .. server_name .. ".enabled"))

				-- can disable lsp for local project
				if require("neoconf").get("lspconfig." .. server_name .. ".enabled") == false then
					return
				end

				local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server_name)

				-- print(server_name)
				-- print(has_custom_opts)

				if has_custom_opts then
					opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
				end

				lspconfig[server_name].setup(opts)
			end,
		})
	end,
}
