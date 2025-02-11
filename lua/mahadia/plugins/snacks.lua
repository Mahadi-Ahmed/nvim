local setup, snacks = pcall(require, "snacks")
if not setup then
  return
end

-- Initialize snacks with configuration
snacks.setup({
  bigfile = { enabled = true },
  dashboard = { enabled = true },
  indent = { enabled = false },
  input = { enabled = true },
  notifier = {
    enabled = true,
    timeout = 3000,
  },
  picker = {
    enabled = true,
    sources = {
      files = {
        hidden = true,
        ignored = false,
      },
      git_files = {
        untracked = true
      }
    }
  },
  quickfile = { enabled = true },
  scope = { enabled = true },
  -- scroll = { enabled = true },
  statuscolumn = { enabled = true },
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
    snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>tc")
    snacks.toggle.treesitter():map("<leader>tT")
    snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>tb")
    snacks.toggle.inlay_hints():map("<leader>th")
    snacks.toggle.indent():map("<leader>tg")
    snacks.toggle.dim():map("<leader>tD")
  end,
})

