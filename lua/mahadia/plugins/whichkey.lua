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
  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
  { "<leader>j", group = "Harpoon" },
  { "<leader>ja", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Index 4" },
  { "<leader>jd", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Index 2" },
  { "<leader>jf", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Index 1" },
  { "<leader>jg", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "Index 5" },
  { "<leader>jh", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", desc = "Index 6" },
  { "<leader>ji", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "add file" },
  { "<leader>jm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "toggle menu" },
  { "<leader>jr", "<cmd>Telescope harpoon marks<cr>", desc = "Telescope Harpoon" },
  { "<leader>js", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Index 3" },
  { "<leader>l", group = "LSP" },
  { "<leader>lR", group = "references" },
  { "<leader>lW", group = "workspace symbols" },
  { "<leader>la", group = "code action" },
  { "<leader>lf", group = "formatting" },
  { "<leader>li", group = "declarations" },
  { "<leader>lj", group = "next diagnostic" },
  { "<leader>lk", group = "previous diagnostic" },
  { "<leader>lo", group = "open float" },
  { "<leader>lr", group = "rename" },
  { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "diagnostics" },
  { "<leader>m", group = "Session" },
  { "<leader>mr", group = "Restore session for cwd" },
  { "<leader>ms", group = "Save session for auto session root dir" },
  { "<leader>q", "<cmd>qa<CR>", desc = "Quit" },
  { "<leader>s", group = "Search" },
  { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
  { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Find open buffers" },
  { "<leader>sc", "<cmd>Telescope grep_string<cr>", desc = "Find Text under cursor" },
  { "<leader>sf", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Find files" },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
  { "<leader>t", "<cmd>ColorizerToggle<CR>", desc = "Colorizer toggle" },
  { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undotree toggle" },
  { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
})
