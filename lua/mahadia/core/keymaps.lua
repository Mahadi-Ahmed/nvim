-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = false }

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
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Nvim-tree --
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Leader Key stuff --
keymap("n", "<leader>q", ":qa!<ENTER>")
keymap("n", "<leader>w", ":w<ENTER>")

-- telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap("n", "<leader>st", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap("n", "<leader>sc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap("n", "<leader>sb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap("n", "<leader>sh", "<cmd>Telescope help_tags<cr>") -- list available help tags
-- Dont save x in registeter
--keymap("n", "x", '"_x')
--
keymap("n","<leader>jm",":lua require(\"harpoon.ui\").toggle_quick_menu()<cr>")
keymap("n","<leader>ji","<cmd>lua require(\"harpoon.mark\").add_file()<cr>")
keymap("n","<leader>jf",":lua require(\"harpoon.ui\").nav_file(1)<cr>")
keymap("n","<leader>jd",":lua require(\"harpoon.ui\").nav_file(2)<cr>")
keymap("n","<leader>js",":lua require(\"harpoon.ui\").nav_file(3)<cr>")
keymap("n","<leader>ja",":lua require(\"harpoon.ui\").nav_file(4)<cr>")
keymap("n","<leader>jr",":Telescope harpoon marks<cr>")

keymap("n","<leader>bm", ":MaximizerToggle<cr>")
