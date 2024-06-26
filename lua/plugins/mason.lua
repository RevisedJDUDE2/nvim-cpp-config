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
              cmd = { "clangd", "--query-driver=C:/msys64/mingw64/bin/g++.exe", "", "--log=error", "--background-index", "--completion-style=detailed" },
              filetypes = { "c", "cpp" },
            })
            function _G.DEBUG_CLANGD()
              print("Running: "..lspconfig.clangd.cmd[1].." "..lspconfig.clangd.cmd[2].." "..lspconfig.clangd.cmd[3])
            end
        end
    }
}
