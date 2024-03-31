-- Setting default filetype on automatically run slow formatters async
local slow_format_filetypes = {
	cs = true,
	python = true,
}
return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			css = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			graphql = { "prettierd" },
			cs = { "csharpier" },
			python = { "isort", "black" },
		},
		format_on_save = function(bufnr)
			if slow_format_filetypes[vim.bo[bufnr].filetype] then
				return
			end
			local function on_format(err)
				if err and err:match("timeout$") then
					slow_format_filetypes[vim.bo[bufnr].filetype] = true
				end
			end

			return { timeout_ms = 500, lsp_fallback = true }, on_format
		end,

		format_after_save = function(bufnr)
			if not slow_format_filetypes[vim.bo[bufnr].filetype] then
				return
			end
			return { lsp_fallback = true }
		end,

		-- format_on_save = function(bufnr)
		-- 	local ignore_filetypes = { "cs" }
		-- 	if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
		-- 		return
		-- 	end
		-- 	return { timeout_ms = 500, async = false, lsp_fallback = true }
		-- end,

		-- format_on_save = {
		-- 	pattern = ".lua,*.graphql,*.css,*.html,*.json,*.yaml,*.md,*.gql,*.rs",
		-- 	timeout_ms = 500,
		-- 	async = false,
		-- 	lsp_fallback = true,
		-- },
	},
	config = function(_, opts)
		require("conform").setup(opts)
	end,
}
