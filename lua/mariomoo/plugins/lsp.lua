return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        "j-hui/fidget.nvim",
    },

    config = function()
        -- lsp
        require("fidget").setup()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "gopls",
                "lua_ls",
                "templ",
                "golangci_lint_ls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup{}
                end,

                -- global vim variable
                ["lua_ls"] = function ()
                    require("lspconfig").lua_ls.setup{
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end,
                ["emmet_language_server"] = function()
                    require("lspconfig").emmet_language_server.setup{
                        filetypes = {
                            "templ", "html"
                        },
                    }
                end
            },
            ["eslint"] = function()
                require("lspconfig").eslint.setup({
                    settings = {
                        format = { enable = true },  -- Enable formatting
                        lintTask = {
                            enable = true
                        }
                    }
                })
            end,
            ["tsserver"] = function()
                require("lspconfig").tsserver.setup({
                    filetypes = { "typescript", "typescriptreact" },
                    root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
                    settings = {
                        typescript = {
                            preferences = {
                                importModuleSpecifier = "relative"
                            },
                        },
                    },
                })
            end
        })

        -- diagnostics
        vim.diagnostic.config({
            virtual_text = true
        })


        -- completion
        local cmp = require("cmp")
        local cmp_select = {behavior = cmp.SelectBehavior.Select}

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),

            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            })
        })

    end
}
