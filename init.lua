require 'mahadia.core.colorscheme'
require 'mahadia.core.options'
require 'mahadia.core.keymaps'
require 'mahadia.plugins-setup'
require 'mahadia.plugins.whichkey'
require 'mahadia.plugins.treesitter'
require 'mahadia.plugins.comment'
require 'mahadia.plugins.nvim-tree'
require 'mahadia.plugins.lualine'
require 'mahadia.plugins.telescope'
-- require 'mahadia.plugins.cmp'
require 'mahadia.plugins.lsp'
require 'mahadia.plugins.harpoon'
require 'mahadia.plugins.autopairs'
require 'mahadia.plugins.toggleterm'

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})
