require("mariomoo")

local augroup = vim.api.nvim_create_augroup
local moo = augroup('mariomoo', {})

local autocmd = vim.api.nvim_create_autocmd

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd({"BufWritePre"}, {
    group = moo,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd({"BufWritePre"}, {
    group = moo,
    pattern = "*.go",
    callback = function()
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        vim.api.nvim_command('silent %!gofmt')
        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end
})

autocmd('LspAttach', {
    group = moo,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- vim.api.nvim_exec([[
--   autocmd BufNewFile,BufRead *.templ set filetype=templ
-- ]], false)
