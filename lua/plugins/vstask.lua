return {
	"EthanJWright/vs-tasks.nvim",
	enabled = false,
	event = { "VimEnter" },
	keys = {
		{ "<leader>tl", "<cmd>lua require('telescope').extensions.vstask.tasks()<cr>", { desc = "[T]ask [L]ist" } },
		{ "<leader>ti", "<cmd>lua require('telescope').extensions.vstask.inputs()<cr>", { desc = "[T]ask [I]nput" } },
		{
			"<leader>th",
			"<cmd>lua require('telescope').extensions.vstask.history()<cr>",
			{ desc = "[T]ask [H]istory" },
		},
		{ "<leader>tc", "<cmd>lua require('telescope').extensions.vstask.close()<cr>", { desc = "[T]ask [C]lose" } },
	},
	dependencies = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("vstask").setup({
			cache_json_conf = false, -- don't read the json conf every time a task is ran
			cache_strategy = "last", -- can be "most" or "last" (most used / last used)
			config_dir = ".vscode", -- directory to look for tasks.json and launch.json
			use_harpoon = false, -- use harpoon to auto cache terminals
			telescope_keys = { -- change the telescope bindings used to launch tasks
				vertical = "<C-v>",
				split = "<C-s>",
				tab = "<C-t>",
				current = "<CR>",
			},
			autodetect = { -- auto load scripts
				npm = "on",
			},
			terminal = "toggleterm",
			term_opts = {
				vertical = {
					direction = "vertical",
					size = "80",
				},
				horizontal = {
					direction = "horizontal",
					size = "10",
				},
				current = {
					direction = "float",
				},
				tab = {
					direction = "tab",
				},
			},
			json_parser = vim.json.decode,
			-- json_parser = require('json5').parse,
			-- json_parser = 'vim.fn.json.decode',
			-- json_parser = 'vim.fn.json_decode',
		})

		-- local task = require 'telescope.extensions.vstask'
	end,
}
