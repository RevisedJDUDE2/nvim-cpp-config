return {
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				stages = "fade",
				timeout = 3000,
				render = "minimal",
        background_colour = "#000000",
			})
			vim.notify = require("notify")
      vim.keymap.set("n", "<leader>cn", function()
        require('notify').dismiss({ silent = true, pending = true })
      end)
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("noice").setup({
        lsp = {
          signature = {
            enabled = false,
          }
        },
        views = {
          cmdline_popup = {border = {style = "single", padding = {0,0} }},
        },
      })
		end,
	},
}
