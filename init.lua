vim.loader.enable()

require 'mahadia.core.options'
require 'mahadia.core.keymaps'

-- Set up transparency once, not on every colorscheme change
local function setup_transparency()
  local highlights = {
    "Normal", "SignColumn", "NormalNC", "TelescopeBorder",
    "NvimTreeNormal", "NvimTreeNormalNC", "EndOfBuffer", "MsgArea"
  }
  local cmds = {}
  for _, name in ipairs(highlights) do
    table.insert(cmds, string.format("highlight %s ctermbg=none guibg=none", name))
  end
  vim.cmd(table.concat(cmds, '\n'))
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = setup_transparency,
  desc = "Remove backgrounds for transparency",
})

-- Initialize plugin manager
require 'mahadia.plugins'

-- Load UI components
require 'mahadia.plugins.themery'
require 'mahadia.plugins.whichkey'
require 'mahadia.plugins.lualine'
require 'mahadia.plugins.bufferline'

-- Load editor enhancements
require 'mahadia.plugins.treesitter'
require 'mahadia.plugins.comment'
require 'mahadia.plugins.nvim-tree'
require 'mahadia.plugins.telescope'
require 'mahadia.plugins.lspZero'
require 'mahadia.plugins.cmp'

-- Load additional features
require 'mahadia.plugins.harpoon'
require 'mahadia.plugins.autopairs'
require 'mahadia.plugins.toggleterm'
require 'mahadia.plugins.gitsigns'
require 'mahadia.plugins.autoSession'
require 'mahadia.plugins.ufo'
require 'mahadia.plugins.hardtime'
require 'mahadia.plugins.undotree'

-- autocmd creation
local highlight_yank_group = vim.api.nvim_create_augroup('HighlightYank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = highlight_yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 40 })
  end,
  desc = "Highlight yanked text",
})

-- Buffer kill command
vim.api.nvim_create_user_command("BufferKill", function()
  require('mahadia.plugins.bufferline').buf_kill "bd"
end, {})
