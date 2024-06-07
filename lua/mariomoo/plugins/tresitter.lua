return {
    "nvim-treesitter/nvim-treesitter",

    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "python", "c", "go", "lua", "vim", "javascript", "templ", "vimdoc"},

            sync_install = false,

            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}
