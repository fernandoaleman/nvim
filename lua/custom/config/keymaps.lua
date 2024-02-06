-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-------------------------------------------------
-- General Keymaps
-------------------------------------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- visual
keymap.set("v", "<", "<gv", { desc = "Stay in right indentation mode" }) -- right indentation
keymap.set("v", ">", ">gv", { desc = "Stay in left indentation mode" }) -- left indentation

-- Move selected lines with shift+j or shift+k
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
