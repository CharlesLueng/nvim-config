return {
	{
		"numToStr/Comment.nvim",
		keys = { "gcc", "gc", "gbc", "gb", "gcO", "gco", "gcA" },
		event = { "BufReadPre" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"kkoomen/vim-doge",
		run = ":call doge#install()",
		enabled = false,
		ft = { "python", "cs", "vue", "typescript", "javascript", "html", "ruby" },
		config = function()
			local map = vim.keymap
			-- Generate comment for current line
			map.set("n", "<Leader>lc", "<Plug>(doge-generate)", { desc = "Generate Doc Comment" })

			-- Interactive mode comment todo-jumping
			map.set("n", "<TAB>", "<Plug>(doge-comment-jump-forward)")
			map.set("n", "<S-TAB>", "<Plug>(doge-comment-jump-backward)")
			map.set("i", "<TAB>", "<Plug>(doge-comment-jump-forward)")
			map.set("i", "<S-TAB>", "<Plug>(doge-comment-jump-backward)")
			map.set("x", "<TAB>", "<Plug>(doge-comment-jump-forward)")
			map.set("x", "<S-TAB>", "<Plug>(doge-comment-jump-backward)")

			vim.g.doge_enable_mappings = 0

			-- language specific configuration eg.
			-- vim.g.doge_javascript_settings = {
			-- 	destructuring_props = 1,
			-- 	omit_redundant_param_types = 0,
			-- }
		end,
	},
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({
				input_after_comment = true,
				languages = {
					cs = {
						template = {
							annotation_convention = "xmldoc",
						},
					},
					python = {
						template = {
							annotation_convention = "google_docstrings",
						},
					},
					vue = {
						template = {
							annotation_convention = "jsdoc",
						},
					},
					typescript = {
						template = {
							annotation_convention = "tsdoc",
						},
					},
					typescriptreact = {
						template = {
							annotation_convention = "tsdoc",
						},
					},
					javascript = {
						template = {
							annotation_convention = "jsdoc",
						},
					},
					javascriptreact = {
						template = {
							annotation_convention = "jsdoc",
						},
					},
					lua = {
						template = {
							annotation_convention = "emmylua",
						},
					},
				},
			})

			local map = vim.keymap

			map.set("n", "<Leader>lc", "<cmd>Neogen<cr>", { desc = "Generate Doc Comment" })
		end,
	},
}
