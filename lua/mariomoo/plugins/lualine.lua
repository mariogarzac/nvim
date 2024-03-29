return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local custom_tokyo = require'lualine.themes.tokyonight'
        -- custom_tokyo.normal.c.bg = 'none'

        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = custom_tokyo,
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {{'mode', 'buffers',
                show_filename_only = true,   -- Shows shortened relative path when set to false.
                hide_filename_extension = true,   -- Hide filename extension when set to true.
                show_modified_status = true, }},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
}
