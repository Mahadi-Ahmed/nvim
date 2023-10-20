local setup, auto_session = pcall(require, "auto-session")
if not setup then
  return
end

auto_session.setup({
  auto_session_supress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
  auto_restore_enabled = false,
  -- auto_save_enabled = true,
})

local keymap = vim.keymap
keymap.set("n", "<leader>mr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
keymap.set("n", "<leader>ms", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
