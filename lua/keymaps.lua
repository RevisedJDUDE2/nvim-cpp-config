vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", "<cmd>:NvimTreeFocus<cr>")
vim.keymap.set( {"n", "v"}, "<leader>w", "<cmd>:w!<cr>")
vim.keymap.set("n", "<leader>f", "<cmd>:NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>lw", "<C-w>l")
vim.keymap.set("n", "<c-y>", "<cmd>:y +<cr>")
