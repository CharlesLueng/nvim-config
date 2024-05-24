return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- "hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip", -- snippet engine
			build = (function()
				-- Build Step is needed for regex support in snippets
				-- This step is not supported in many windows environments
				-- Remove the below condition to re-enable on windows
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				-- `friendly-snippets` contains a variety of premade snippets.
				--    See the README about individual language/framework/plugin snippets:
				--    https://github.com/rafamadriz/friendly-snippets
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load({})

						require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })
					end,
				},
			},
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"onsails/lspkind.nvim", -- vs-code like pictograms
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		-- "zbirenbaum/copilot-cmp",
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")
		luasnip.config.setup({})

		require("luasnip").log.set_loglevel("info")

		local lspkind = require("lspkind")

		local has_words_before = function()
			if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
				return false
			end
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
		end

		cmp.setup({
			-- 注释禁用cmp
			-- enabled = function()
			-- 	-- disable completion in comments
			-- 	local context = require("cmp.config.context")
			-- 	-- keep command mode completion enabled when cursor is in a comment
			-- 	if vim.api.nvim_get_mode().mode == "c" then
			-- 		return true
			-- 	else
			-- 		return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
			-- 	end
			-- end,
			-- completion = {
			-- 	completeopt = "menu,menuone,preview,noselect",
			-- },
			completion = { completeopt = "menu,menuone,noinsert" },
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
					symbol_map = { Copilot = "" },
				}),
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({

				-- Select the [n]ext item
				-- ["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-n>"] = vim.schedule_wrap(function(fallback)
					if cmp.visible() and has_words_before() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					else
						fallback()
					end
				end),

				["<C-Space>"] = cmp.mapping.complete(),
				-- Select the [p]revious item
				["<C-p>"] = vim.schedule_wrap(function(fallback)
					if cmp.visible() and has_words_before() then
						cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
					else
						fallback()
					end
				end),
				-- cmp.mapping.select_prev_item(),

				-- scroll the documentation window [b]ack / [f]orward
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				-- Accept ([y]es) the completion.
				--  This will auto-import if your LSP supports it.
				--  This will expand snippets if the LSP sent a snippet.
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				-- ["<tab>"] = cmp.mapping.confirm({ select = true }),

				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

				-- Manually trigger a completion from nvim-cmp.
				--  Generally you don't need this, because nvim-cmp will display
				--  completions whenever it has completion options available.
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),

				-- Think of <c-l> as moving to the right of your snippet expansion.cmp
				--  So if you have a snippet that's like:
				--  function $name($args)
				--    $body
				--  end
				--
				-- <c-l> will move you to the right of each of the expansion locations.
				-- <c-h> is similar, except moving you backwards.
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
				-- ["<C-Space>"] = cmp.mapping.complete(),
				-- ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			-- sources = {
			-- 	{ name = "copilot", keyword_length = 0 },
			-- 	{ name = "nvim_lsp" },
			-- 	{ name = "luasnip" }, -- For luasnip users.
			-- 	{ name = "path" },
			-- },
			sources = cmp.config.sources({
				-- { name = "copilot", group_index = 2, keyword_length = 0 },
				{ name = "nvim_lsp", group_index = 2 },
				{ name = "luasnip", group_index = 2 }, -- For luasnip users.
				{ name = "path", group_index = 2 },
			}),
			-- sorting = {
			-- 	priority_weight = 2,
			-- 	-- comparators = {
			-- 	-- 	require("copilot_cmp.comparators").prioritize,
			-- 	--
			-- 	-- 	-- Below is the default comparitor list and order for nvim-cmp
			-- 	-- 	cmp.config.compare.offset,
			-- 	-- 	-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
			-- 	-- 	cmp.config.compare.exact,
			-- 	-- 	cmp.config.compare.score,
			-- 	-- 	cmp.config.compare.recently_used,
			-- 	-- 	cmp.config.compare.locality,
			-- 	-- 	cmp.config.compare.kind,
			-- 	-- 	cmp.config.compare.sort_text,
			-- 	-- 	cmp.config.compare.length,
			-- 	-- 	cmp.config.compare.order,
			-- 	-- },
			-- },
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		-- snippets
		-- require('luasnip.loaders.from_vscode').load {
		--   paths = { '~/.config/nvim/snippets' },
		-- }
	end,
}
