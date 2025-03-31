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
  { "<leader><space>", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>" , desc = "find buffers" },
  { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },

  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
  { "<leader>q", "<cmd>qa<CR>", desc = "Quit" },
  { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undotree toggle" },
  { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },

  { "<leader>b", group = "Buffers" },
  { "<leader>bm", "<cmd>MaximizerToggle<cr>", desc = "Maximize split toggle" },
  {
    "<leader>f",
    function()
      local _, builtin = pcall(require, "telescope.builtin")
      local _, themes = pcall(require, "telescope.themes")
      local ok = pcall(builtin.git_files, themes.get_dropdown({ previewer = false }))
      if not ok then
        builtin.find_files(themes.get_dropdown())
      end
    end,
    desc = "Find File"
  },

  { "<leader>g", group = "Git" },
  { "<leader>gc", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)" },
  { "<leader>gC", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit in repo" },
  { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
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
  { "<leader>js", "<cmd>lua require('harpoon'):list():select(3)<cr>", desc = "Index 3" },
  -- { "<leader>jr", "<cmd>lua _G.harpoon_telescope(require('harpoon'):list())<cr>", desc = "Telescope Harpoon" },

  { "<leader>l", group = "lsp zero" },
  { "<leader>lR", desc = "references" },
  { "<leader>lW", desc = "workspace symbols" },
  { "<leader>la", desc = "code action" },
  { "<leader>lf", desc = "formatting" },
  { "<leader>lf", function() vim.lsp.buf.format() end, mode = "v", desc = "Format selection" },
  { "<leader>li", desc = "declarations" },
  { "<leader>lj", desc = "next diagnostic" },
  { "<leader>lk", desc = "previous diagnostic" },
  { "<leader>lo", desc = "open float" },
  { "<leader>lr", desc = "rename" },
  { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "diagnostics" },
  { "<leader>lm", "<cmd>%!jq . <cr>", desc = "Format json" },

  { "<leader>m", group = "Session" },
  { "<leader>mr", group = "Restore session for cwd" },
  { "<leader>ms", group = "Save session for auto session root dir" },

  { "<leader>s", group = "Search" },
  { "<leader>s:", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
  { "<leader>sl", "<cmd>Telescope current_buffer_fuzzy_find theme=ivy<cr>", desc = "Current buffer fuzzy find" },
  { "<leader>sc", "<cmd>Telescope grep_string<cr>", desc = "Find Text under cursor" },
  { "<leader>sf", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Find files" },
  { "<leader>sh", "<cmd>Telescope<cr>", desc = "Find pickers" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
  { "<leader>sT", "<cmd>TodoTelescope<cr>", desc = "Find ToDo" },
  { "<leader>ss", "<cmd>Telescope spell_suggest theme=cursor<cr>", desc = "Spelling" },
  { "<leader>sn", "<cmd>lua require('noice').cmd('cmd') <cr>", desc = "open Notification in window" },
  { "<leader>su", "<cmd>Telescope undo<cr>", desc = "Undo History" },

  { "<leader>t", group = "Toggle\'s" },
  { "<leader>tt", "<cmd>ColorizerToggle<CR>", desc = "Colorizer toggle" },
})
