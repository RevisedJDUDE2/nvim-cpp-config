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
if _G.theme == nil or _G.theme == ' ' or _G.theme == '' then
  _G.theme = "vim"
end
vim.cmd("colorscheme ".._G.theme)

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
vim.opt.guicursor = "n-v-c-i:block"
vim.opt.termguicolors = true
