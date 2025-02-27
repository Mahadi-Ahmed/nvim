-- Configure undo directory for persistent undo
local undodir = vim.fn.expand('~/.undodir')

-- Create the undo directory if it doesn't exist
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p", 0700)
end

-- Configure undo settings
vim.opt.undodir = undodir  -- Set undo directory
vim.opt.undofile = true    -- Enable persistent undo
vim.opt.undolevels = 10000 -- Maximum number of changes that can be undone
vim.opt.undoreload = 10000 -- Maximum number lines to save for undo on a buffer reload

-- Set undotree plugin settings before the plugin loads
-- Using vim.g for global variables used by Vim plugins
vim.g.undotree_WindowLayout = 1
vim.g.undotree_SplitWidth = 60
vim.g.undotree_DiffpanelHeight = 10
vim.g.undotree_SetFocusWhenToggle = 1
