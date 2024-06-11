print("Youkso")
-- vim.notify("Youksou!", vim.log.levels.INFO)
require("keymaps")
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
function jakul(name)
  print(name .. " Nice Works!")
end
