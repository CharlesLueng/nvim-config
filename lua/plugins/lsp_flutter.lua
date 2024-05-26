return {
	"akinsho/flutter-tools.nvim",
	ft = { "dart" },
	keys = {
		{
			"<leader>fF",
			"<CMD>lua require('telescope').extensions.flutter.commands()<cr>",
			{ desc = "Telescope Flutter Commands" },
		},
	},
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {},
	config = function(_, opts)
		require("flutter-tools").setup(opts)

		require("telescope").load_extension("flutter")
	end,
}
