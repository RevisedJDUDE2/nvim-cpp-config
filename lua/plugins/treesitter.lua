return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "lua", "cpp", "c", "vim", "vimdoc", "glsl", "go", "rust" },
            auto_install = true,
            highlight = { enable = true, },
        }
    end
}
