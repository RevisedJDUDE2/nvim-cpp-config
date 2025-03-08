return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		-- print("works")
		require("nvim-tree").setup({
  			sort = {
    				sorter = "case_sensitive",
  			},
  			view = {
    				width = 25,
  			},
  			renderer = {
    				group_empty = false,
  			},
  			filters = {
    				dotfiles = true,
  			},
		})
	end
}
