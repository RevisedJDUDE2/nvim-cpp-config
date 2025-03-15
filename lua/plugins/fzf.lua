return {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = "make",
  config = function()
    local telescope = require("telescope")
    telescope.setup {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
    require('telescope').load_extension('fzf')
  end,
}
