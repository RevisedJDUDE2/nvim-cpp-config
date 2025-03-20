return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		-- print("works")
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 27,
				signcolumn = "no",
			},
			renderer = {
				group_empty = false,
			},
			filters = {
				dotfiles = true,
			},
			update_focused_file = {
				enable = true,
			},
		})
	end,
}
