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

            --- ALSO LUA SNIPET AND AUTO COMPLETES DOES NOT WORK

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
            })

            --- I DONT KNOW THE FUCKING REASON IT WONT WORK
            --- LSP Works BUT WHEN I TYPE THE INCLUDE IS C++ IT WONT SHOW THE INCLUDES AND STD IS
            --- AN UNDEFINED IDENTIFIER SHIT... WHEN I MEAN LSP WORK. I MEAN IS THAT IT DETECTS THE I DONT HAVE std defined
            --- FUCK THIS SHIT SOMEONE PLEASE FIX!!!!!!!!!!
            ---
            --- TODO: FIX THIS SHIT
            print("LSP MASON HERE")
            lspconfig.clangd.setup({
              --FIND FOR INCLUDES? , AND SET THE COMPILE COMMANDS DIR TO .,  RUN CLANGD
              cmd = { "clangd", "--query-driver=C:/msys64/mingw64/bin/g++.exe", "--compile-commands-dir=./build", "--log=error", "--background-index", },
              --print("Running: "..cmd[1].. cmd[2].."="..cmd[3])
              capabilities = capabilities,
              --IDK WHY?
              single_file_support = true,
              filetypes = { "c", "cpp" },
            })
            function _G.DEBUG_CLANGD()
              print("Running: "..lspconfig.clangd.cmd[1].." "..lspconfig.clangd.cmd[2].." "..lspconfig.clangd.cmd[3])
            end
        end
    }
}
