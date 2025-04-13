return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      --"hrsh7th/cmp-cmdline",
    }
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = false,
    config = function()
      require("mason").setup {}
    end
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require 'cmp'
      require("luasnip.loaders.from_vscode").lazy_load()
      local kind_icons = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
      }
      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            side_padding = 1,
            border = "none",
            col_offset = -3,
            max_height = 10
          }),
          --documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp', max_item_count = 12 },
          { name = 'luasnip', max_item_count = 12 },
        }, {
          { name = 'buffer', max_item_count = 12 },
        }),
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = function(entry, vim_item)
            if(_G.enable_cmp_debug_output) then
              print(vim.inspect(vim_item))
            end
            vim_item.menu = ""
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            --vim_item.abbr = vim_item.abbr:gsub("~$", "")
            return vim_item
          end
        }
      })


    end
  }
}
