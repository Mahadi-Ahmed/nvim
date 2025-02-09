local setup, snacks = pcall(require, "snacks")
if not setup then
  return
end

-- Initialize snacks with configuration
snacks.setup({
  bigfile = { enabled = true },
  dashboard = { enabled = true },
  -- indent = { enabled = true },
  input = { enabled = true },
  notifier = {
    enabled = true,
    timeout = 3000,
  },
  picker = { enabled = true },
  quickfile = { enabled = true },
  scope = { enabled = true },
  -- scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  styles = {
    notification = {}
  }
})

-- Define keymaps after ensuring snacks is loaded

-- Set up autocommand to configure keymaps after VeryLazy event
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()

    -- Set up toggles
    snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
    snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
    snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tL")
    snacks.toggle.diagnostics():map("<leader>td")
    snacks.toggle.line_number():map("<leader>tl")
  end,
})

