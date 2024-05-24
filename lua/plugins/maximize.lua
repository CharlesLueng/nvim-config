return {
	-- "declancm/maximize.nvim",
	-- keys = {
	-- 	{ "<leader>wm", '<cmd>lua require("maximize").toggle()<cr>', "Toggle Window" },
	-- },
	-- lazy = true,
	-- config = function()
	-- 	require("maximize").setup()
	-- end,
	"anuvyklack/windows.nvim",
	dependencies = { "anuvyklack/middleclass", "anuvyklack/animation.nvim" },
	config = function()
		vim.o.winwidth = 10
		vim.o.winminwidth = 10
		vim.o.equalalways = false
		require("windows").setup()

		local function cmd(command)
			return table.concat({ "<Cmd>", command, "<CR>" })
		end

		vim.keymap.set("n", "<leader>wm", cmd("WindowsMaximize"))
	end,
}
