return {
	"ojroques/nvim-bufdel",
	keys = {
		{ "<leader>bc", "<cmd>BufDel<cr>", desc = "[B]uffer [D]elete" },
		{ "<leader>bo", "<cmd>BufDelOthers<cr>", desc = "[B]uffer Delete [O]ther" },
		{ "<leader>bA", "<cmd>BufDelAll<cr>", desc = "[B]uffer Delete [A]ll" },
	},
	config = function()
		require("bufdel").setup({
			next = "tabs",
			quit = false, -- quit Neovim when last buffer is closed
		})
	end,
}
