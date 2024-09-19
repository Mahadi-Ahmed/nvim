-- appearance
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.cursorline = true -- highlight the current line
vim.opt.signcolumn = "yes"
vim.opt.title = true
vim.opt.titlestring = "%<%F%=%l/%L" -- what the title of the window will be set to
vim.opt.fillchars = { vert = ' ', eob = ' '}
-- vim.o.background = "light" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])

-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 8

vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true
vim.opt.mouse = "a" -- allow the mouse to be used in neovim

vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.updatetime = 300 -- faster completion (4000ms default)

-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.showtabline = 2
-- vim.opt.colorcolumn = "120"
vim.opt.guifont = "FiraCode Nerd Font:h16"

vim.opt.wrap = false -- line wrapping
vim.opt.splitright = true --force all vertical splits to go to the right of current window

-- vim.opt.completeopt = { "menuone", "noselect" } -- set behaviour for popup completion 

vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 100 -- faster completion (4000ms default)
vim.opt.undofile = true  -- enable persistent undo

-- vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.g["sneak#label"] = true

-- vim.opt.foldlevel = 20
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- UFO folding
vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.g.skip_ts_context_commentstring_module = true

-- autoSessions
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
