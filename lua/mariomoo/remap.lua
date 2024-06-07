-- leader key
vim.g.mapleader = " "

-- return to project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selected lines using JK
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move line up while keeping cursor at the beginning
vim.keymap.set("n","J","mzJ`z")

-- paste over selected line without losing the yanked line
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- insert err return for go
vim.keymap.set("n", "<leader>ee","oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

-- reindent the code
vim.keymap.set("n", "<leader>rf","gg<C-v><S-G>=<C-o>")


