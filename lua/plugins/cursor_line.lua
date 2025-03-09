return {
  "ya2s/nvim-cursorline",
  config = function ()
    require("nvim-cursorline").setup {
      cursorline = {
        enable = true,
        timeout = 0,
        number = false,
      },
      cursorword = {
        enable = true,
        min_length = 2,
        hl = { underline = true },
      }
    }
  end
}
