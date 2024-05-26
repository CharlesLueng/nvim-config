local function is_active()
	local ok, hydra = pcall(require, "hydra.statusline")
	return ok and hydra.is_active()
end

local function get_name()
	local ok, hydra = pcall(require, "hydra.statusline")
	if ok then
		return hydra.get_name()
	end
	return ""
end

return {
	"nvim-lualine/lualine.nvim",
	opts = {
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", { "diagnostics" }, { get_name, cond = is_active } },
			lualine_c = { { "filename", path = 0 } },
			lualine_x = { "encoding" },
			lualine_y = {
				"progress",
				{
					function()
						local is_loaded = vim.api.nvim_buf_is_loaded
						local tbl = vim.api.nvim_list_bufs()
						local loaded_bufs = 0
						for i = 1, #tbl do
							if is_loaded(tbl[i]) then
								loaded_bufs = loaded_bufs + 1
							end
						end
						return loaded_bufs
					end,
					icon = "",
					-- color = { fg = "DarkCyan", gui = "bold" },
				},
				"fileformat",
			},
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
