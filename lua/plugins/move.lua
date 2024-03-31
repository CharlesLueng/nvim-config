return {
	-- "fedepujol/move.nvim",
	-- keys = { "<C-j>", "<C-k>", "<C-h>", "<C-l>" },
	-- -- enabled = false,
	-- config = function()
	-- 	require("move").setup({
	-- 		line = {
	-- 			enable = true, -- Enables line movement
	-- 			indent = true, -- Toggles indentation
	-- 		},
	-- 		block = {
	-- 			enable = true, -- Enables block movement
	-- 			indent = true, -- Toggles indentation
	-- 		},
	-- 		word = {
	-- 			enable = true, -- Enables word movement
	-- 		},
	-- 		char = {
	-- 			enable = false, -- Enables char movement
	-- 		},
	-- 	})
	--
	-- 	local opts = { noremap = true, silent = true }
	-- 	-- Normal-mode commands
	-- 	vim.keymap.set("n", "<C-j>", ":MoveLine(1)<CR>", opts)
	-- 	vim.keymap.set("n", "<C-k>", ":MoveLine(-1)<CR>", opts)
	-- 	vim.keymap.set("n", "<C-h>", ":MoveHChar(-1)<CR>", opts)
	-- 	vim.keymap.set("n", "<C-l>", ":MoveHChar(1)<CR>", opts)
	-- 	-- vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
	-- 	-- vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)
	--
	-- 	-- Visual-mode commands
	-- 	vim.keymap.set("v", "<C-j>", ":MoveBlock(1)<CR>", opts)
	-- 	vim.keymap.set("v", "<C-k>", ":MoveBlock(-1)<CR>", opts)
	-- 	vim.keymap.set("v", "<C-h>", ":MoveHBlock(-1)<CR>", opts)
	-- 	vim.keymap.set("v", "<C-l>", ":MoveHBlock(1)<CR>", opts)
	-- end,
	"echasnovski/mini.move",
	version = "*",
	event = "BufReadPre",
	-- keys = { "<C-j>", "<C-k>", "<C-h>", "<C-l>" },
	opts = {
		mappings = {
			-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
			left = "<C-h>",
			right = "<C-l>",
			down = "<c-j>",
			up = "<c-k>",

			-- Move current line in Normal mode
			line_left = "<C-h>",
			line_right = "<c-l>",
			line_down = "<c-j>",
			line_up = "<c-k>",
		},

		-- Options which control moving behavior
		options = {
			-- Automatically reindent selection during linewise vertical move
			reindent_linewise = true,
		},
	},
}
