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
      separator = {left = ' ', right = ' '},
      modified = {button = 'w'},
      button = "+",
      filetype = {
        custom_colors = true,
      }
    }
  },
  version = '^1.0.0',
}
