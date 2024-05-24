return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	keys = {
		{ "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { desc = "find files" } },
		{ "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { desc = "find grep" } },
		{
			"<leader>fw",
			"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>",
			{ desc = "find current_file grep" },
		},
		{ "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { desc = "find buffers" } },
		{
			"<leader>ma",
			"<cmd>lua require('telescope').extensions.vim_bookmarks.all()<cr>",
			{ desc = "find files bookmarks" },
		},
		{
			"<leader>mc",
			"<cmd>lua require('telescope').extensions.vim_bookmarks.current_file()<cr>",
			{ desc = "find current_files bookmarks" },
		},
		{
			"<leader>fk",
			"<cmd>lua require('telescope.builtin').keymaps()<cr>",
			{ desc = "List keymaps" },
		},
	},
	dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
				file_ignore_patterns = {
					"codegen.ts",
					".git",
					"lazy-lock.json",
					"*-lock.yaml",
					"node_modules",
					"%.lock",
					"build",
					"release",
					"bin",
					"obj",
					"*_modules",
					"dist-electron",
					"dist",
					".vscode",
					"App_Data",
				},
				dynamic_preview_title = true,
				path_display = { "smart" },
			},
			pickers = {
				find_files = {
					hidden = true,
					previewer = true,
				},
				buffers = {
					previewer = false,
					layout_config = {
						vertical = { width = 0.5 },
						-- other layout configuration here
					},
					mappings = {
						i = {
							["<c-d>"] = actions.delete_buffer + actions.move_to_top,
						},
					},
				},
			},
			layout_config = {
				horizontal = {
					preview_cutoff = 100,
					preview_width = 0.5,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}
