return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	-- keys = {
	-- 	{ "<leader>ha", desc = "[H]arpoon [A]dd Mark" },
	-- 	{
	-- 		"<C-e>",
	-- 		"<cmd>lua require('harpoon').ui.toggle_quick_menu(require('harpoon').list())<cr>",
	-- 		desc = "Harpoon Edit Mark List",
	-- 	},
	-- 	-- { "<leader>hl", desc = "Harpoon Edit Mark List" },
	-- 	{ "<leader>hp", desc = "[H]arpoon [P]rev" },
	-- 	{ "<leader>hn", desc = "[H]arpoon [N]ext" },
	-- 	"<A-1>",
	-- 	"<A-2>",
	-- 	"<A-3>",
	-- 	"<A-4>",
	-- 	"<A-5>",
	-- 	"<A-6>",
	-- 	"<A-7>",
	-- 	"<A-8>",
	-- 	"<A-9>",
	-- },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		-- vim.keymap.set('n', '<leader>tl', require('telescope').extensions.vstask.tasks, { desc = '[T]ask [L]ist' })
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():append()
		end, { desc = "[H]arpoon [A]dd Mark" })
		vim.keymap.set("n", "<c-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon Edit Mark List" })

		vim.keymap.set("n", "<leader>hl", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "[H]arpoon Edit Mark [L]ist" })

		for i = 1, 9, 1 do
			vim.keymap.set("n", "<A-" .. i .. ">", function()
				harpoon:list():select(i)
			end, { desc = "Harpoon Select " .. i })
		end
		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "[H]arpoon [P]rev" })
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "[H]arpoon [N]ext" })
	end,
}
