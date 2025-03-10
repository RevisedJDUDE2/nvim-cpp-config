vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", "<cmd>:NvimTreeFocus<cr>")
vim.keymap.set( {"n", "v"}, "<leader>w", "<cmd>:w!<cr>")
vim.keymap.set("n", "<leader>nc", "<cmd>:NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>lw", "<C-w>l")
vim.keymap.set("n", "<c-y>", "<cmd>:y +<cr>")
-- FOR BABAR NVIM
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<leader>bp', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>bn', '<Cmd>BufferNext<CR>', opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv");
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv");
