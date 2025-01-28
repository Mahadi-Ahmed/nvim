vim.loader.enable()
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local hl_groups = {
      "Normal",
      "SignColumn",
      "NormalNC",
      "TelescopeBorder",
      "NvimTreeNormal",
      "NvimTreeNormalNC",
      "EndOfBuffer",
      "MsgArea",
    }
    for _, name in ipairs(hl_groups) do
      vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
    end
  end,
})

require 'mahadia.core.options'
require 'mahadia.plugins'
require 'mahadia.plugins.themery'
-- require 'mahadia.core.colorscheme'
-- require 'mahadia.plugins.theme'
require 'mahadia.core.keymaps'
require 'mahadia.plugins.whichkey'
require 'mahadia.plugins.treesitter'
require 'mahadia.plugins.comment'
require 'mahadia.plugins.nvim-tree'
require 'mahadia.plugins.lualine'
require 'mahadia.plugins.telescope'
require 'mahadia.plugins.bufferline'
require 'mahadia.plugins.lspZero'
require 'mahadia.plugins.cmp'
require 'mahadia.plugins.harpoon'
require 'mahadia.plugins.autopairs'
require 'mahadia.plugins.toggleterm'
require 'mahadia.plugins.gitsigns'
require 'mahadia.plugins.autoSession'
require 'mahadia.plugins.ufo'
require 'mahadia.plugins.hardtime'


-- uncommented since i havent implemented persistent undotree yet
require 'mahadia.plugins.undotree'

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

vim.api.nvim_create_user_command("BufferKill", function()
  require('mahadia.plugins.bufferline').buf_kill "bd"
end, {})

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

