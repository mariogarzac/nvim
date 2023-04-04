-- leader key
vim.g.mapleader = " "

-- return to project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- map , to :
vim.keymap.set("n", ",", ":")

-- move selected lines using JK
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move line up while keeping cursor at the beginning 
vim.keymap.set("n","J","mzJ`z")

-- create a terminal in a new tab
vim.keymap.set("n", "<C-t>", ":tabnew | term \n")

-- paste over selected line without losing the yanked line
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>t", "gt")
