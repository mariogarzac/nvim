return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "python", "c", "go", "lua", "vim", "javascript", "templ"},

            sync_install = false,

            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }

        -- local treesitter_parser_config = require("nvim-tresitter.parsers").get_parser_configs() 
        -- treesitter_parser_config.templ {
            -- install_info = {
                -- url = "https://github.com/vrischmann/tree-sitter-templ.git",
                -- files = {"src/parcer.c", "src/scanner.c"},
                -- branch = "master",
            -- }
        -- }
        -- vim.treesitter.language.register('templ', 'templ')
    end
}
