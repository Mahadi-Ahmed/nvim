local wk = require("which-key")

-- Setup options
local setup = {
  preset= "modern",
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
  sort = { "order"},
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
  { "<leader>bf", "<cmd>lua Snacks.picker.buffers() <cr>", desc = "Find" },
  { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close all to the left" },
  { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Jump" },
  { "<leader>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close all to the right" },
  { "<leader>bm", "<cmd>MaximizerToggle<cr>", desc = "Maximize split toggle" },
  { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next" },
  { "<leader>c", "<cmd>BufferKill<CR>", desc = "Close Buffer" },
  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
  { "<leader>f",
    function()
      local _, snacks = pcall(require, "snacks")
      local is_git = vim.fn.finddir('.git', '.') ~= ''
      if is_git then
        snacks.picker.git_files()
      else
        snacks.picker.files()
      end
    end,
    desc = "Find File"
  },

  { "<leader>g", group = "Git" },
  { "<leader>gc", "<cmd>lua Snacks.picker.git_log_file() <cr>", desc = "Checkout commit(for current file)" },
  { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
  { "<leader>gb", "<cmd>lua Snacks.picker.git_branches() <cr>", desc = "Checkout branch" },
  { "<leader>gC", "<cmd>lua Snacks.picker.git_log() <cr>", desc = "Checkout commit" },
  { "<leader>gd", "<cmd>lua Snacks.picker.git_diff() <cr>", desc = "Git Diff (Hunks)" },
  { "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", desc = "Lazygit" },
  { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next Hunk" },
  { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Prev Hunk" },
  { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
  { "<leader>go", "<cmd>lua Snacks.picker.git_status() <cr>", desc = "Open changed file" },
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
  { "<leader>js", "<cmd>lua require('harpoon'):list():select(3)<cr>", desc = "Index 3" },
  -- { "<leader>jr", "<cmd>lua _G.harpoon_telescope(require('harpoon'):list())<cr>", desc = "Telescope Harpoon" },

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
  { "<leader>lw", "<cmd>lua Snacks.picker.diagnostics() <cr>", desc = "diagnostics" },

  { "<leader>m", group = "Session" },
  { "<leader>mr", group = "Restore session for cwd" },
  { "<leader>ms", group = "Save session for auto session root dir" },

  { "<leader>s", group = "Search" },
  { "<leader>sC", "<cmd>lua Snacks.picker.commands() <cr>", desc = "Commands" },
  { "<leader>sR", "<cmd>lua Snacks.picker.registers() <cr>", desc = "Registers" },
  { "<leader>sb", "<cmd>lua Snacks.picker.buffers() <cr>", desc = "Find open buffers" },
  { "<leader>s:", "<cmd>lua Snacks.picker.commands() <cr>", desc = "Commands" },
  { "<leader>sl", "<cmd>lua Snacks.picker.lines() <cr>", desc = "Buffer lines" },
  { "<leader>sc", "<cmd>lua Snacks.picker.grep_word() <cr>", desc = "Find Text under cursor" },
  { "<leader>sf", "<cmd>lua Snacks.picker.files() <cr>", desc = "Find files" },
  { "<leader>sh", "<cmd>lua Snacks.picker.pickers() <cr>", desc = "Find pickers" },
  { "<leader>sk", "<cmd>lua Snacks.picker.keymaps() <cr>", desc = "Keymaps" },
  { "<leader>st", "<cmd>lua Snacks.picker.grep() <cr>", desc = "Find Text" },
  { "<leader>sT", "<cmd>lua Snacks.picker.todo_comments() <cr>", desc = "Find Text" },
  { "<leader>ss", "<cmd>lua Snacks.picker.spelling() <cr>", desc = "Find Text" },
  { "<leader>sn", "<cmd>lua require('noice').cmd('cmd') <cr>", desc = "open Notification in window" },
  { "<leader>su", "<cmd>lua Snacks.picker.undo() <cr>", desc = "Undo History" },

  { "<leader>t", group = "Toggle\'s" },
  { "<leader>tt", "<cmd>ColorizerToggle<CR>", desc = "Colorizer toggle" },
})
