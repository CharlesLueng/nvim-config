return {
	{
		"windwp/nvim-ts-autotag",
		ft = { "ts", "tsx", "vue", "markdown" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"axelvc/template-string.nvim",
		ft = { "js", "jsx", "ts", "tsx" },
		config = function()
			require("template-string").setup({})
		end,
	},
}
