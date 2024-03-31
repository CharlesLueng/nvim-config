return {
	"stevearc/overseer.nvim",
	-- depends = 'nvim-lua/plenary.nvim',
	dependencies = {
		"akinsho/toggleterm.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<leader>tl", "<cmd>OverseerToggle<cr>", desc = "[T]ask [L]ist" },
		{ "<leader>tr", "<cmd>OverseerRun<cr>", desc = "[T]ask [R]un" },
		{ "<leader>ti", "<cmd>OverseerInfo<cr>", desc = "[T]ask [I]nfo" },
		{ "<leader>tc", "<cmd>OverseerClose<cr>", desc = "[T]ask [C]lose" },
		{ "<leader>tC", "<cmd>OverseerClearCache<cr>", desc = "[T]ask Clear [C]ache" },
	},
	opts = {},
	config = function()
		require("overseer").setup({
			strategy = {
				"toggleterm",
				-- load your default shell before starting the task
				use_shell = false,
				-- overwrite the default toggleterm "direction" parameter
				direction = nil,
				-- overwrite the default toggleterm "highlights" parameter
				highlights = nil,
				-- overwrite the default toggleterm "auto_scroll" parameter
				auto_scroll = nil,
				-- have the toggleterm window close and delete the terminal buffer
				-- automatically after the task exits
				close_on_exit = false,
				-- have the toggleterm window close without deleting the terminal buffer
				-- automatically after the task exits
				-- can be "never, "success", or "always". "success" will close the window
				-- only if the exit code is 0.
				quit_on_exit = "never",
				-- open the toggleterm window when a task starts
				open_on_start = true,
				-- mirrors the toggleterm "hidden" parameter, and keeps the task from
				-- being rendered in the toggleable window
				hidden = false,
				-- command to run when the terminal is created. Combine with `use_shell`
				-- to run a terminal command before starting the task
				on_create = nil,
			},
			-- task_list = {
			-- bindings = {
			--   ['<Tab>'] = 'IncreaseDetail',
			--   ['<S-Tab>'] = 'DecreaseDetail',
			--   ['gh'] = 'IncreaseAllDetail',
			--   ['gl'] = 'DecreaseAllDetail',
			-- },
			-- },
		})
	end,
}
