return {
    {
	    "williamboman/mason.nvim",
	    config = function()
            require("mason").setup()
	    end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
            })
            lspconfig.clangd.setup({
              cmd = { "clangd", "--query-driver", "C:\\msys64\\mingw64\\bin\\g++.exe", "--compile-commands-dir=.", },
              capabilities = capabilities,
              single_file_support = true,
              filetypes = { "c", "cpp" },
              root_dir = lspconfig.util.root_pattern('.clangd','compile_commands.json'),
            --}
            })
        end
    }
}
