local setup, themery = pcall(require, "themery")
if not setup then
  return
end

themery.setup({
  themes = {
    {
      name = "Gruvbox dark",
      colorscheme = "gruvbox",
      before = [[
      -- All this block will be executed before apply "set colorscheme"
      vim.opt.background = "dark"
    ]],
    },
    {
      name = "Gruvbox light",
      colorscheme = "gruvbox",
      before = [[
      vim.opt.background = "light"
    ]],
      after = [[-- Same as before, but after if you need it]]
    },
    {
      name = "rose-pine",
      colorscheme = "rose-pine",
      before = [[
      vim.opt.background = "dark"
    ]],
      after = [[-- Same as before, but after if you need it]]
    },
    {
      name = "rose-pine-light",
      colorscheme = "rose-pine",
      before = [[
      vim.opt.background = "light"
    ]],
      after = [[-- Same as before, but after if you need it]]
    }
  },
  themeConfigFile = "~/.config/nvim/lua/mahadia/plugins/theme.lua",
  livePreview = true,
})
