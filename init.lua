vim.g.mapleader = " "
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
local inp = vim.fn.input("Select Colorscheme: gruvbox(g) / tokyonight (t) "):lower()
while inp ~= "" and inp ~= " " do
	if inp == "g" then
		_G.theme_name = "gruvbox"
		_G.theme = "gruvbox"
		break
	elseif inp == "t" then
		_G.theme_name = "tokyonight"
		_G.theme = "tokyonight-night"
		break
	end
	inp = vim.fn.input("Invalid input. Please enter 'g' or 't': "):lower()  -- Ask again --ask
end

require("lazy").setup("plugins")
require("keymaps")
require("editor")
require("build-script")
vim.g.gruvbox_italic = 1
require("notify")("ようこそ", "info")
vim.api.nvim_set_hl(0, "Comment", { fg = "#928374", italic = true })
