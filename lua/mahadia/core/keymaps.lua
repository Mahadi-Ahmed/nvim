-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = false }

-- NOTE: look for more keymaps in whichkey.lua

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation - NOTE: not needed anymore since i use tmux-navigator
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Dont save x in registeter
--keymap("n", "x", '"_x')

-- Resize with arrows
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
-- keymap("n", "k", "kzz")
-- keymap("n", "j", "jzz")

-- ToggleTerm
keymap("n", "<M-a>", ":ToggleTerm direction=horizontal size=15<CR>", opts)
keymap("n", "<M-s>", ":ToggleTerm direction=vertical size=80<CR>", opts)
keymap("n", "<M-f>", ":ToggleTerm direction=float<CR>", opts)

-- visual block mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

keymap("x", "<leader>p", [["_dP"]])
keymap({"n", "v"}, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])
keymap({"n", "v"}, "<leader>p", [["+p"]])
keymap({"n", "v"}, "<leader>P", [["+P"]])

-- vnoremap  <leader>y  "+y
-- nnoremap  <leader>Y  "+yg_
-- nnoremap  <leader>y  "+y
-- nnoremap  <leader>yy  "+yy
--
-- " " Paste from clipboard
-- nnoremap <leader>p "+p
-- nnoremap <leader>P "+P
-- vnoremap <leader>p "+p
-- vnoremap <leader>P "+P
