return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = _G.theme_name,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { "NVimTree" },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 10,
            tabline = 10,
            winbar = 10,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "diagnostics" },
          lualine_c = {
            {
              "filename",
              file_status = true,
              path = 1,
              symbols = {
                modified = "[*]",
                readonly = "[READ ONLY!]",
                unnamed = "[No Name]",
                newfile = "[New]",
              },
            },
          },
          lualine_x = { "filetype" },
          lualine_y = {"diff", "branch"},
          lualine_z = { "os.date('%a %I:%M %p')", "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { "nvim-tree" },
      })
    end,
  },
}
