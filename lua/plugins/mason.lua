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

            lspconfig.clangd.setup({
              --FIND FOR INCLUDES? , AND SET THE COMPILE COMMANDS DIR TO .,  RUN CLANGD
              cmd = { "clangd", "--query-driver", "C:\\msys64\\mingw64\\bin\\", },
              capabilities = capabilities,
              --IDK WHY?
              single_file_support = true,
              filetypes = { "c", "cpp" },
              --FILE??????
              root_dir = lspconfig.util.root_pattern('.clangd','compile_commands.json'),
            })
        end
    }
}
