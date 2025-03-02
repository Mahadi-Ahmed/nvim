local setup, flash = pcall(require, "flash")
if not setup then
  return
end

-- Set up configuration
flash.setup({
  labels = "asdfghjklqwertyuiopzxcvbnm",
  search = {
    multi_window = true,
    forward = true,
    wrap = true,
    mode = "exact",
    exclude = {
      "notify",
      "cmp_menu",
      "noice",
      "flash_prompt",
      function(win)
        return not vim.api.nvim_win_get_config(win).focusable
      end,
    },
  },
  jump = {
    jumplist = true,
    pos = "start",
    history = false,
    register = false,
    nohlsearch = false,
    autojump = false,
  },
  label = {
    uppercase = true,
    exclude = "",
    current = true,
    after = true,
    before = false,
    style = "overlay",
    reuse = "lowercase",
    distance = true,
    min_pattern_length = 0,
  },
  highlight = {
    backdrop = true,
    matches = true,
    priority = 5000,
    groups = {
      match = "FlashMatch",
      current = "FlashCurrent",
      backdrop = "FlashBackdrop",
      label = "FlashLabel",
    },
  },
  modes = {
    search = {
      enabled = true, -- Make sure search mode is enabled
      highlight = { backdrop = false },
      jump = { history = true, register = true, nohlsearch = true },
    },
    char = {
      enabled = true,
      autohide = true,
      multi_line = true,
      label = { exclude = "hjkliardc" },
      search = { wrap = false },
      highlight = { backdrop = true },
      jump = { register = false, autojump = false },
    },
    treesitter = {
      labels = "abcdefghijklmnopqrstuvwxyz",
      jump = { pos = "range", autojump = true },
      search = { incremental = false },
      label = { before = true, after = true, style = "inline" },
      highlight = {
        backdrop = false,
        matches = false,
      },
    },
  },
  prompt = {
    enabled = true,
    prefix = { { "⚡", "FlashPromptIcon" } },
    win_config = {
      relative = "editor",
      width = 1,
      height = 1,
      row = -1,
      col = 0,
      zindex = 1000,
    },
  },
})

-- Set up keymaps
local keymap = vim.keymap.set

-- Normal and Visual mode: 'f' acts like general search (old 's' behavior)
keymap({"n", "x"}, "f", function()
  require("flash").jump({
    search = { mode = "search" } -- Force it to use search mode
  })
end, { desc = "Flash Jump" })

-- Operator-pending mode: 'f' acts like character motion
keymap("o", "f", function()
  require("flash").jump({ mode = "char" })
end, { desc = "Flash f" })

-- Other keymaps
keymap({"n", "x", "o"}, "F", function()
  require("flash").jump({ mode = "char", reverse = true })
end, { desc = "Flash F" })

keymap({"n", "x", "o"}, "t", function()
  require("flash").jump({ mode = "char", til = true })
end, { desc = "Flash t" })

-- For repeat functionality
keymap({"n", "x", "o"}, ";", function()
  require("flash").jump({ continue = true })
end, { desc = "Flash Continue" })

keymap({"n", "x", "o"}, ",", function()
  require("flash").jump({ continue = true, reverse = true })
end, { desc = "Flash Continue Reverse" })
