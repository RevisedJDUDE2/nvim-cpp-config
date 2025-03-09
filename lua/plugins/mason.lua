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
            print("LSP MASON HERE")
            lspconfig.clangd.setup({
              capabilities = capabilities,
              cmd = { "C:/Users/User/AppData/Local/nvim-data/mason/packages/clangd/clangd_19.1.2/bin/clangd.exe", "--query-driver=C:/msys64/mingw64/bin/g*.exe", "--background-index", "--clang-tidy", "--compile-commands-dir=./build-debug", "--header-insertion=never", "--inlay-hints=true", "--completion-style=detailed" },
              filetypes = { "c", "cpp" },
              on_attach = function (cli, bufnr)
                require "lsp_signature".on_attach(cli, bufnr)
              end
            })
        end
    }
}
