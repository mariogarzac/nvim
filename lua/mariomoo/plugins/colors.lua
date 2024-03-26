-- function SetColors(color)
	-- color = color or "tokyonight-storm",
	-- vim.cmd.colorscheme(color),
-- 
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
    -- vim.cmd('highlight SignColumn guibg=NONE')
-- end

return {
    {
    "folke/tokyonight.nvim",
    lazy = false, 
    priority = 1000, 
    config = function()
        require("tokyonight").setup({
            style = "storm",
            transparent = false,
            terminal_colors = true,
            styles = {
                sidebars = "dark",
                floats = "dark",
            }
        })
        vim.cmd("colorscheme tokyonight")
    end
  },
}
