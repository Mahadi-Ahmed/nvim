local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

nvimtree.setup({
  git = {
    enable = true,
    ignore = false,
    timeout = 200,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
})
