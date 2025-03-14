vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", "<cmd>:NvimTreeFocus<cr>")
--vim.keymap.set( {"n", "v"}, "<leader>w", "<cmd>:w!<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>:w<cr>")
vim.keymap.set("n", "<leader>nc", "<cmd>:NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>lw", "<C-w>l")
vim.keymap.set("n", "<c-y>", "<cmd>:y +<cr>")
-- FOR BABAR NVIM
--local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
--map('n', '<leader>bp', '<Cmd>BufferPrevious<CR>', opts)
--map('n', '<leader>bn', '<Cmd>BufferNext<CR>', opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv");
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv");

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Show diagnostic message in a floating window for the current line
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
-- Jump to the previous diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- Jump to the next diagnostic
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>df", vim.lsp.buf.format, opts);
vim.api.nvim_set_keymap('t', '<C-t>c', '<C-\\><C-n>', { noremap = true, silent = true })

