return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	opts = {
		diagnostic = {
			border_follow = false,
			keys = {
				quit = { "q", "<ESC>", "<C-c>" },
				quit_in_show = { "q", "<ESC>", "<C-c>" },
			},
		},
		code_action = {
			keys = {
				quit = { "q", "<ESC>", "<C-c>" },
			},
		},
		ui = {
			-- 关闭烦人的CodeAction的小灯泡，哪哪都是小灯泡
			-- 取而代之则使用自定义高亮行, SignColumn 和 高亮行
			code_action = " ",
		},
	},
	-- config = function()
	-- 	local keymap = vim.keymap
	--
	-- 	require("lspsaga").setup({
	-- 		diagnostic = {
	-- 			border_follow = false,
	-- 			keys = {
	-- 				quit = { "q", "<ESC>" },
	-- 			},
	-- 		},
	-- 	})
	-- end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
}
