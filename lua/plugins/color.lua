-- Default options:
return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		opts = {
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = false,
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = true,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "hard", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
      style = "night",
      terminal_colors = true,
      styles = {
        keywords = {italic = true, bold = true},
      }
    },
	},
}
