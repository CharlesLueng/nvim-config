return {
	"nvim-lualine/lualine.nvim",
	opts = {
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", { "diagnostics" } },
			lualine_c = { { "filename", path = 0 } },
			lualine_x = { "encoding" },
			lualine_y = { "progress", "fileformat" },
			lualine_z = { "filetype" },
		},
	},
	-- config = function()
	-- 	require("lualine").setup({
	-- 		sections = {
	-- 			lualine_a = { "mode" },
	-- 			lualine_b = { { "filename", path = 3 } },
	-- 			lualine_c = { "diagnostics" },
	-- 			lualine_x = {},
	-- 			lualine_y = {},
	-- 			lualine_z = { "filetype" },
	-- 		},
	-- 	})
	-- end,
}
