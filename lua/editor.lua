local tabsize = 2
local default_theme = "habamax" --"retrobox" 
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.wrap = false

vim.opt.tabstop = tabsize
vim.opt.softtabstop = tabsize
vim.opt.shiftwidth = tabsize
vim.opt.expandtab = true
vim.opt.ruler = true -- enables ruler (optional for some themes)
vim.opt.autoindent = true -- enables autoindent
vim.opt.smartindent = true -- enables smartindent
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = { eob = " " }
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.updatetime = 5
vim.opt.swapfile = false
vim.opt.guifont = "Iosevka NF:h12"
vim.opt.backup = false
if _G.theme == nil or _G.theme == ' ' or _G.theme == '' then
  _G.theme = default_theme
  _G.theme_name = "base16"
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
vim.api.nvim_create_user_command("Transparent", function ()
  --local gruvbox = require("gruvbox")
  --gruvbox.config.transparent_mode = not gruvbox.config.transparent_mode
  --gruvbox.setup(gruvbox.config)
  require("gruvbox").setup({
    transparent_mode = true,
  })
  vim.cmd("colorscheme gruvbox")
end, {})
