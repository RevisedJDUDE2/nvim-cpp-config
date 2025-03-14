return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  config = function ()
    require("lsp_signature").setup({
      bind = true,
      handler_opts = {
        border = "none"
      },
      hint_enable = false,
      doc_lines = 0,
      max_height = 6,
    })
  end,
  opts = {
    bind = true,
    handler_opts = {
      border = "none",
    },
    hint_enable = false,
    doc_lines = 0,
    max_height = 6,
  },
  -- or use config
  -- config = function(_, opts) require'lsp_signature'.setup({you options}) end
}
