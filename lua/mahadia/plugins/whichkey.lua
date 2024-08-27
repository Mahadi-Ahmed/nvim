local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true,       -- shows a list of your marks on ' and `
    registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false,   -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  -- key_labels = {
  --   -- override the label used to display some keys. It doesn't effect WK in any other way.
  --   -- For example:
  --   -- ["<space>"] = "SPC",
  --   ["<cr>"] = "RET",
  --   -- ["<tab>"] = "TAB",
  -- },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+",      -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>",   -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded",       -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },                                             -- min and max height of the columns
    width = { min = 20, max = 50 },                                             -- min and max width of the columns
    spacing = 4,                                                                -- spacing between columns
    align = "center",                                                           -- align columns left, center or right
  },
  -- ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
  -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true,                                                             -- show help message on the command line when the popup is visible
  triggers = "auto",                                                            -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  -- triggers_blacklist = {
  --   -- list of mode / prefixes that should never be hooked by WhichKey
  --   -- this is mostly relevant for key maps that start with a native binding
  --   -- most people should not need to change this
  --   i = { "j", "k" },
  --   v = { "j", "k" },
  -- },
}

local opts = {
  mode = "n",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>qa<CR>", "Quit" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["c"] = { "<cmd>BufferKill<CR>", "Close Buffer" },
  ["f"] = {
    function()
      local _, builtin = pcall(require, "telescope.builtin")
      local _, themes = pcall(require, "telescope.themes")
      local ok = pcall(builtin.git_files, themes.get_dropdown({previewer = false}))
      -- local ok = pcall(builtin.git_files)

      if not ok then
        -- builtin.find_files(themes.get_dropdown({previewer = false}))
        builtin.find_files(themes.get_dropdown())
      end
    end,
    "Find File",
  },
  ["u"] = { "<cmd>UndotreeToggle<CR>", "Undotree toggle" },
  ["t"] = { "<cmd>ColorizerToggle<CR>", "Colorizer toggle" },
  b = {
    name = 'Buffers',
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
    f = { "<cmd>Telescope buffers<cr>", "Find" },
    b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
    m = { ':MaximizerToggle<cr>', 'Maximize split toggle' },
    c = { "<cmd>BufferKill<CR>", "Close Buffer" },
    e = {
      "<cmd>BufferLinePickClose<cr>",
      "Pick which buffer to close",
    },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    l = {
      "<cmd>BufferLineCloseRight<cr>",
      "Close all to the right",
    },
  },
  -- Actual mappings in lspZero.lua
  l = {
    name = 'LSP',
    W = { 'workspace symbols' },
    w = { "<cmd>Telescope diagnostics<cr>", "diagnostics" },
    i = { 'declarations' },
    o = { 'open float' },
    j = { 'next diagnostic' },
    f = { 'formating' },
    k = { 'previous diagnostic' },
    a = { 'code action' },
    R = { 'references' },
    r = { 'rename' },
    -- f = { require("lvim.lsp.utils").format, "Format" }
  },
  g = {
    name = 'Git',
    g = { "<cmd>lua _lazygit_toggle()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Git Diff",
    },
  },
  j = {
    name = 'Harpoon',
    m = { ':lua require("harpoon.ui").toggle_quick_menu()<cr>', 'toggle menu' },
    i = { '<cmd>lua require("harpoon.mark").add_file()<cr>', 'add file' },
    f = { ':lua require("harpoon.ui").nav_file(1)<cr>', 'Index 1' },
    d = { ':lua require("harpoon.ui").nav_file(2)<cr>', 'Index 2' },
    s = { ':lua require("harpoon.ui").nav_file(3)<cr>', 'Index 3' },
    a = { ':lua require("harpoon.ui").nav_file(4)<cr>', 'Index 4' },
    g = { ':lua require("harpoon.ui").nav_file(5)<cr>', 'Index 5' },
    h = { ':lua require("harpoon.ui").nav_file(6)<cr>', 'Index 6' },
    r = { ':Telescope harpoon marks<cr>', 'Telescope Harpoon' }
  },
  s = {
    name = 'Search',
    t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
    c = { "<cmd>Telescope grep_string<cr>", "Find Text under cursor" },
    f = {
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Find files",
    },
    b = { "<cmd>Telescope buffers<cr>", "Find open buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },
  m = {
    r = { 'Restore session for cwd' },
    s = { 'Save session for auto session root dir' },
  }
}

which_key.setup(setup)
which_key.register(mappings, opts)
