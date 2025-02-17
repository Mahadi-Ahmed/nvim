vim.loader.enable()

require 'mahadia.core.options'
require 'mahadia.core.keymaps'

-- Set up transparency once, not on every colorscheme change
local function setup_transparency()
  local highlights = {
    "Normal", "SignColumn", "NormalNC",
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
