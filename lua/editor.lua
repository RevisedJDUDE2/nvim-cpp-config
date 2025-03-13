vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.wrap = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.ruler = true -- enables ruler (optional for some themes)
vim.opt.autoindent = true -- enables autoindent
vim.opt.smartindent = true -- enables smartindent
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = { eob = " " }
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.updatetime = 10
vim.opt.swapfile = false
vim.opt.guifont = "Iosevka NF:h12"
vim.cmd("colorscheme gruvbox")

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
vim.opt.guicursor = "n-v-c-i:block"
