vim.g.mapleader = " "
local map = vim.keymap

-- map.set("i", "jk", "<ESC>")

map.set("n", "j", [[v:count?'j':'gj']], { noremap = true, expr = true })
map.set("n", "k", [[v:count?'k':'gk']], { noremap = true, expr = true })

map.set("n", "<esc>", "<cmd>nohl<CR><ESC>", { desc = "Clear search highlights" })

map.set("n", "<leader>ww", "<C-w>w", { desc = "Toggle" })
map.set("n", "<leader>wh", "<C-w>h", { desc = "Move Left" })
map.set("n", "<leader>wl", "<C-w>l", { desc = "Move Right" })
map.set("n", "<leader>wj", "<C-w>j", { desc = "Move Down" })
map.set("n", "<leader>wk", "<C-w>k", { desc = "Move Up" })
map.set("n", "<leader>wc", "<C-w>c", { desc = "Close" })
map.set("n", "<leader>w=", "<C-w>=", { desc = "Balance" })
map.set("n", "<leader>ws", "<C-w>s", { desc = "H" })
map.set("n", "<leader>wv", "<C-w>v", { desc = "V" })

map.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "Tab New" })
map.set("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Tab Next" })
map.set("n", "<leader><tab>p", "<cmd>tabprev<cr>", { desc = "Tab Prev" })
map.set("n", "<leader><tab>c", "<cmd>tabclose<cr>", { desc = "Tab Close" })
