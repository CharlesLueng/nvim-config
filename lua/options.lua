local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.scrolloff = 5
opt.sidescrolloff = 5
vim.wo.signcolumn = "yes"

opt.hlsearch = true
opt.incsearch = true

opt.mouse:append("a")
opt.clipboard:append("unnamedplus")

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.cursorline = true
opt.termguicolors = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- colorscheme
-- vim.g.everforest_diagnostic_line_highlight = 1

-- vim.fn.sign_define({
-- 	{
-- 		name = "DiagnosticSignError",
-- 		text = "",
-- 		texthl = "DiagnosticSignError",
-- 		linehl = "ErrorLine",
-- 	},
-- 	{
-- 		name = "DiagnosticSignWarning",
-- 		text = "",
-- 		texthl = "DiagnosticSignWarning",
-- 		linehl = "WarningLine",
-- 	},
-- 	{
-- 		name = "DiagnosticSignInfo",
-- 		text = "",
-- 		texthl = "DiagnosticSignInfo",
-- 		linehl = "InfoLine",
-- 	},
-- 	{
-- 		name = "DiagnosticSignHint",
-- 		text = "",
-- 		texthl = "DiagnosticSignHint",
-- 		linehl = "HintLine",
-- 	},
-- })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 300,
		})
	end,
})

local powershell_options = {
	-- shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
	shell = "powershell",
	shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
	shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
	shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
	shellquote = "",
	shellxquote = "",
}

for option, value in pairs(powershell_options) do
	vim.opt[option] = value
end

-- 取消自动注释
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
