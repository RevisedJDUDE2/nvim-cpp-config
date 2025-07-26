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
        ensure_installed = { "lua_ls", "clangd", "cmake" },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      local data_path = vim.fn.stdpath("data"):gsub("\\", "/")
      local mason_bin = "/mason/bin"
      local mason_pckgs = "/mason/packages"
      local lsp_util = require("lspconfig.util")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            telemetry = {
              enable = false,
            },

          }
        }
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { data_path..mason_bin.."/clangd.cmd", "--query-driver=C:/msys64/mingw64/bin/g*.exe", "--background-index", "--clang-tidy", "--header-insertion=never", "--inlay-hints=true", "--completion-style=detailed" },
        filetypes = { "c", "cpp" },
        on_attach = function(cli, bufnr)
          require "lsp_signature".on_attach(cli, bufnr)
          vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { noremap = true, silent = true, buffer = bufnr })
        end
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
        cmd = {"gopls"},
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = require"lspconfig.util".root_pattern("go.work", "go.mod", ".git"),
        on_attach = function(cli, bufnr)
          require "lsp_signature".on_attach(cli, bufnr)
        end
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        filetypes = {"rust", "rs"},
        cmd = {"C:/Users/User/AppData/Local/nvim-data/mason/bin/rust-analyzer.cmd"},
        root_dir = require("lspconfig.util").root_pattern("Cargo.toml", "rust-project.json", ".git"),
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              loadOutDirsFromCheck = true
            },
            procMacro = {
              enable = true
            }
          }
        }
      })

      lspconfig.cmake.setup({
        capabilities = capabilities,
        cmd = {data_path..mason_bin.."/cmake-language-server.cmd"},
        root_dir = lsp_util.root_pattern("txt", "cmake"),
      })

      lspconfig.glsl_analyzer.setup{}
    end
  }
}
