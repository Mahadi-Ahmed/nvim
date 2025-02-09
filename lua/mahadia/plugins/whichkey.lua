local wk = require("which-key")

-- Setup options
local setup = {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  -- window = {
  --   border = "rounded",
  --   position = "bottom",
  --   margin = { 1, 0, 1, 0 },
  --   padding = { 2, 2, 2, 2 },
  --   winblend = 0,
  -- },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 4,
    align = "center",
  },
  show_help = true,
}

wk.setup(setup)

-- Mappings
wk.add({
  { "<leader><space>", "<cmd>lua Snacks.picker.smart()<cr>" , desc = "Smart Find Files" },
  { "<leader>:", "<cmd>lua Snacks.picker.command_history()<cr>", desc = "Command History" },
  { "<leader>n", "<cmd>lua Snacks.picker.notifications() <cr>", desc = "Notification History" },
  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
  { "<leader>q", "<cmd>qa<CR>", desc = "Quit" },
  { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undotree toggle" },
  { "<leader>w", "<cmd>w!<CR>", desc = "Save" },

  { "<leader>b", group = "Buffers" },
  { "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous" },
  { "<leader>bc", "<cmd>BufferKill<CR>", desc = "Close Buffer" },
  { "<leader>be", "<cmd>BufferLinePickClose<cr>", desc = "Pick which buffer to close" },
  { "<leader>bf", "<cmd>Telescope buffers<cr>", desc = "Find" },
  { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close all to the left" },
  { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Jump" },
  { "<leader>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close all to the right" },
  { "<leader>bm", "<cmd>MaximizerToggle<cr>", desc = "Maximize split toggle" },
  { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next" },
  { "<leader>c", "<cmd>BufferKill<CR>", desc = "Close Buffer" },
  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
  { "<leader>f", function()
      local _, builtin = pcall(require, "telescope.builtin")
      local _, themes = pcall(require, "telescope.themes")
      local ok = pcall(builtin.git_files, themes.get_dropdown({previewer = false}))
      if not ok then
        builtin.find_files(themes.get_dropdown())
      end
    end, desc = "Find File" },

  { "<leader>g", group = "Git" },
  { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)" },
  { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
  { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },
  { "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", desc = "Lazygit" },
  { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next Hunk" },
  { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Prev Hunk" },
  { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
  { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
  { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
  { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
  { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
  { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },

  { "<leader>j", group = "Harpoon" },
  { "<leader>ja", "<cmd>lua require('harpoon'):list():select(4)<cr>", desc = "Index 4" },
  { "<leader>jd", "<cmd>lua require('harpoon'):list():select(2)<cr>", desc = "Index 2" },
  { "<leader>jf", "<cmd>lua require('harpoon'):list():select(1)<cr>", desc = "Index 1" },
  { "<leader>jg", "<cmd>lua require('harpoon'):list():select(5)<cr>", desc = "Index 5" },
  { "<leader>jh", "<cmd>lua require('harpoon'):list():select(6)<cr>", desc = "Index 6" },
  { "<leader>jp", "<cmd>lua require('harpoon'):list():prev()<cr>", desc = "Previous mark" },
  { "<leader>jn", "<cmd>lua require('harpoon'):list():next()<cr>", desc = "Next mark" },
  { "<leader>ji", "<cmd>lua require('harpoon'):list():add()<cr>", desc = "Add file" },
  { "<leader>jm", "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>", desc = "Toggle menu" },
  { "<leader>jr", "<cmd>lua _G.harpoon_telescope(require('harpoon'):list())<cr>", desc = "Telescope Harpoon" },
  { "<leader>js", "<cmd>lua require('harpoon'):list():select(3)<cr>", desc = "Index 3" },

  { "<leader>l", group = "lsp zero" },
  { "<leader>lR", desc = "references" },
  { "<leader>lW", desc = "workspace symbols" },
  { "<leader>la", desc = "code action" },
  { "<leader>lf", desc = "formatting" },
  { "<leader>li", desc = "declarations" },
  { "<leader>lj", desc = "next diagnostic" },
  { "<leader>lk", desc = "previous diagnostic" },
  { "<leader>lo", desc = "open float" },
  { "<leader>lr", desc = "rename" },
  { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "diagnostics" },

  { "<leader>m", group = "Session" },
  { "<leader>mr", group = "Restore session for cwd" },
  { "<leader>ms", group = "Save session for auto session root dir" },

  { "<leader>s", group = "Search" },
  { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
  { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Find open buffers" },
  { "<leader>s:", "<cmd>lua Snacks.picker.commands() <cr>", desc = "Commands" },
  { "<leader>sc", "<cmd>Telescope grep_string<cr>", desc = "Find Text under cursor" },
  { "<leader>sf", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Find files" },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },

  { "<leader>t", group = "Toggle\'s" },
  { "<leader>tt", "<cmd>ColorizerToggle<CR>", desc = "Colorizer toggle" },
})
