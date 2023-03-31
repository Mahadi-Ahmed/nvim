local setup, harpoon = pcall(require, "harpoon")
if not setup then
  return
end

harpoon.setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 60,
    -- width = 120,
  }
})
