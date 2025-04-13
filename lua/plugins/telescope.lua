return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    require("telescope").setup({
      defaults = {
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        file_ignore_patterns = { "%.idx", "%.git/*", "clangd%-cache/" },
        selection_caret = '> ',
      },
    })
  end,
}
