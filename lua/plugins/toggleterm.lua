local lazygit_toggle = function()
	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({
		cmd = "lazygit",
		hidden = true,
		direction = "float",
		float_opts = {
			border = "none",
			width = 100000,
			height = 100000,
		},
		on_open = function(_)
			vim.cmd("startinsert!")
		end,
		on_close = function(_) end,
		count = 99,
	})
	lazygit:toggle()
end

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = {
		"ToggleTerm",
		"TermExec",
		"ToggleTermToggleAll",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualLines",
		"ToggleTermSendVisualSelection",
	},
	keys = {
		"<A-s>",
		"<A-v>",
		"<A-f>",
		"<C-\\>",
		{ "<leader>gg", lazygit_toggle, desc = "Lazy[G]it" },
	},
	opts = {--[[ things you want to change go here]]
		active = true,
		on_config_done = nil,
		-- size can be a number or function which is passed the current terminal
		size = 20,
		open_mapping = [[<c-\>]],
		hide_numbers = true, -- hide the number column in toggleterm buffers
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
		start_in_insert = true,
		insert_mappings = true, -- whether or not the open mapping applies in insert mode
		persist_size = false,
		-- direction = 'vertical' | 'horizontal' | 'window' | 'float',
		-- direction = 'float',
		direction = "horizontal",
		close_on_exit = true, -- close the terminal window when the process exits
		shell = nil, -- change the default shell
		-- This field is only relevant if direction is set to 'float'
		float_opts = {
			-- The border key is *almost* the same as 'nvim_win_open'
			-- see :h nvim_win_open for details on borders however
			-- the 'curved' border is a custom border type
			-- not natively supported but implemented in this plugin.
			-- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
			border = "curved",
			-- width = <value>,
			-- height = <value>,
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
		-- Add executables on the config.lua
		-- { cmd, keymap, description, direction, size }
		-- lvim.builtin.terminal.execs = {...} to overwrite
		-- lvim.builtin.terminal.execs[#lvim.builtin.terminal.execs+1] = {"gdb", "tg", "GNU Debugger"}
		-- TODO: pls add mappings in which key and refactor this
		execs = {
			{ nil, "<A-s>", "Horizontal Terminal", "horizontal", 0.3 },
			{ nil, "<A-v>", "Vertical Terminal", "vertical", 0.4 },
			{ nil, "<A-f>", "Float Terminal", "float", nil },
		},
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			-- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<A-/>", [[<C-\><C-n>]], opts)
			-- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<A-Left>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<A-Down>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<A-Up>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<A-Right>", [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set("t", "<A-w>", [[<C-\><C-n><C-w>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
