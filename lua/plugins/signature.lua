return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    bind = true,
    handler_opts = {
      border = "single"
    },
    hint_enable = false,
    doc_lines = 0,
    max_height = 3,
  },
  -- or use config
  -- config = function(_, opts) require'lsp_signature'.setup({you options}) end
}
