return {
	-- "f-person/git-blame.nvim",
	-- event = "BufRead",
	-- config = function()
	-- 	vim.cmd("highlight default link gitblame SpecialComment")
	-- 	vim.g.gitblame_enabled = 0 -- Change the value to 1 her
	-- end,
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			follow_files = true,
		},
		auto_attach = true,
		attach_to_untracked = false,
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
			virt_text_priority = 100,
		},
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000, -- Disable if file is longer than this (in lines)
		preview_config = {
			-- Options passed to nvim_open_win
			border = "single",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
		yadm = {
			enable = false,
		},
		on_attach = function(bufnr)
			local function map(mode, lhs, rhs, opts)
				opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
				vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
			end

			-- Navigation
			map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
			map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

			-- Actions
			map("n", "<leader>gs", ":Gitsigns stage_hunk<CR>")
			map("v", "<leader>gs", ":Gitsigns stage_hunk<CR>")
			map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>")
			map("v", "<leader>gr", ":Gitsigns reset_hunk<CR>")
			map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>")
			map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>")
			map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>")
			map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>")
			map("n", "<leader>gb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
			map("n", "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
			map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>")
			map("n", "<leader>gD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
			map("n", "<leader>gtd", "<cmd>Gitsigns toggle_deleted<CR>")

			-- Text object
			map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
			map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
		end,
	},
}
