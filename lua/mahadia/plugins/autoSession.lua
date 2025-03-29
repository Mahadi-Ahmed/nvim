local setup, auto_session = pcall(require, "auto-session")
if not setup then
  return
end

auto_session.setup({
  auto_session_supress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
  auto_restore = false,
  -- auto_save_enabled = true,
})
