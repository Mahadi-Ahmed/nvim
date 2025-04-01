local setup, themery = pcall(require, "themery")
if not setup then
  return
end

-- themery.setup({
require("themery").setup({
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
    },
    {
      name = "kanagawa-lotus",
      colorscheme = "kanagawa",
      before = [[
      vim.opt.background = "light"
    ]],
      after = [[-- Same as before, but after if you need it]]
    },
    {
      name = "kanagawa",
      colorscheme = "kanagawa",
      before = [[
      vim.opt.background = "dark"
    ]],
      after = [[-- Same as before, but after if you need it]]
    },
    {
      name = "tokyonight-night",
      colorscheme = "tokyonight-night",
      before = [[
      vim.opt.background = "dark"
    ]],
      after = [[-- Same as before, but after if you need it]]
    },
    {
      name = "tokyonight-storm",
      colorscheme = "tokyonight-storm",
      before = [[
      vim.opt.background = "dark"
    ]],
      after = [[-- Same as before, but after if you need it]]
    },
    {
      name = "tokyonight-moon",
      colorscheme = "tokyonight-moon",
      before = [[
      vim.opt.background = "dark"
    ]],
      after = [[-- Same as before, but after if you need it]]
    },
    {
      name = "tokyonight-day",
      colorscheme = "tokyonight-day",
      before = [[
      vim.opt.background = "light"
    ]],
      after = [[-- Same as before, but after if you need it]]
    },
    {
      name = "catppuccin-frappe",
      colorscheme = "catppuccin-frappe",
      before = [[
      vim.opt.background = "dark"
    ]],
      after = [[-- Same as before, but after if you need it]]
    },
    {
      name = "catppuccin-macchiato",
      colorscheme = "catppuccin-macchiato",
      before = [[
      vim.opt.background = "dark"
    ]],
      after = [[-- Same as before, but after if you need it]]
    },
    {
      name = "catppuccin-latte",
      colorscheme = "catppuccin-latte",
      before = [[
      vim.opt.background = "light"
    ]],
      after = [[-- Same as before, but after if you need it]]
    },
    {
      name = "catppuccin-mocha",
      colorscheme = "catppuccin-mocha",
      before = [[
      vim.opt.background = "dark"
    ]],
      after = [[-- Same as before, but after if you need it]]
    },
  },
  -- themeConfigFile = "/Users/mahadiahmed/.config/nvim/lua/mahadia/plugins/theme.lua",
  -- themeConfigFile = "~/.config/nvim/lua/mahadia/plugins/theme.lua",
  livePreview = true,
})
