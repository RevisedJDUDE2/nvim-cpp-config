print("ようこそ") require("keymaps")
require("editor")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
vim.cmd.colorscheme("gruvbox")

--IDK WHY?

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.opt.guifont = "IosevkaTerm Nerd Font:h12"
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { noremap = true, silent = true })
local opts = { noremap = true, silent = true }
-- Show diagnostic message in a floating window for the current line
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
-- Jump to the previous diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- Jump to the next diagnostic
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 10
--vim.opt.swapfile = false
require("build-script")
vim.g.gruvbox_italic = 0
vim.api.nvim_set_hl(0, "Normal", {guibg=NONE, ctermbg=NONE})
require("win_open")
