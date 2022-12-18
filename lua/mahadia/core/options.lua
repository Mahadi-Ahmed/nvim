-- appearance
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.cursorline = true -- highlight the current line
-- vim.opt.signcolumn = "yes"

-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 8

vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true
vim.opt.mouse = "a" -- allow the mouse to be used in neovim

vim.opt.showtabline = 0 -- always show tabs
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.updatetime = 300 -- faster completion (4000ms default)

-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
-- vim.opt.showtabline = 2
vim.opt.guifont = "FiraCode Nerd Font:h16"

vim.opt.wrap = false -- line wrapping

vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.undofile = true  -- enable persistent undo

vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.g["sneak#label"] = true
