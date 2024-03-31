return {
	"folke/todo-comments.nvim",
	keys = {
		{ "]t", "<cmd>lua require('todo-comments').jump_next()<cr>", { desc = "Next todo comment" } },
		{ "[t", "<cmd>lua require('todo-comments').jump_prev()<cr>", { desc = "Previous todo comment" } },
		{ "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Previous todo comment" } },
	},
	event = { "BufReadPre" },
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		-- vim.keymap.set("n", "]t", function()
		-- 	require("todo-comments").jump_next()
		-- end, { desc = "Next todo comment" })
		--
		-- vim.keymap.set("n", "[t", function()
		-- 	require("todo-comments").jump_prev()
		-- end, { desc = "Previous todo comment" })

		-- vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Previous todo comment" })

		require("todo-comments").setup()
	end,
}
