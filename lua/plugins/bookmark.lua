return {
	"MattesGroeger/vim-bookmarks",
	keys = { "<leader>ma", "<leader>mc", "mm", "mi", "mn", "mp", "ma", "mc", "mx" },
	event = { "BufReadPre" },
	dependencies = {
		"tom-anders/telescope-vim-bookmarks.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		vim.g.bookmark_sign = "♥"
		vim.g.bookmark_highlight_lines = 1

		require("telescope").load_extension("vim_bookmarks")
	end,
}
