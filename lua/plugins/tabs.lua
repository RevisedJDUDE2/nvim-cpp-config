return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim", "nvim-tree/nvim-web-devicons",
  },
  init = function ()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    animation = false,
    clickable = true,
    icons = {
      separator = {left = '', right = ' '},
      modified = {button = '*'},
      button = "x",
    }
  },
  version = '^1.0.0',
}
