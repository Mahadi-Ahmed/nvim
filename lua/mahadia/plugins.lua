local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local Event = require("lazy.core.handler.event")
Event.mappings.LazyFile = { id = "LazyFile", event = { "BufReadPost", "BufNewFile", "BufWritePre" } }
Event.mappings["User LazyFile"] = Event.mappings.LazyFile

-- Install your plugins here
local plugins = {
  -- My plugins here
  { "folke/lazy.nvim",       tag = "stable" },
  { "nvim-lua/plenary.nvim", lazy = true }, -- Useful lua functions used ny lots of plugins
  -- Colorschemes
  {
    'rose-pine/neovim',
    lazy = false,
    priority = 1000,
    name = 'rose-pine'
  },
  { "ellisonleao/gruvbox.nvim", name = 'gruvbox',  lazy = true },
  { "rebelot/kanagawa.nvim",    name = 'kanagawa', lazy = true },
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSInstallInfo",
      "TSInstallSync",
      "TSInstallFromGrammar",
    },
    lazy = true,
    event = "VeryLazy",
    config = function()
      require('mahadia.plugins.treesitter')
    end
  },
  {
    'folke/snacks.nvim',
    priority = 1000,
    config = function()
      require('mahadia.plugins.snacks')
    end,
    lazy = false
  },
  {
    'windwp/nvim-ts-autotag',
    lazy = true,
    event = 'LazyFile'
  },
  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    cmd = 'NvimTreeToggle',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require('mahadia.plugins.nvim-tree')
    end
  },
  -- commenting with gc
  {
    "numToStr/Comment.nvim",
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    lazy = true,
    event = "LazyFile",
    config = function()
      require('mahadia.plugins.comment')
    end
  },
  -- Which Key
  {
    "folke/which-key.nvim",
    cmd = "WhichKey",
    event = "VeryLazy",
    dependencies = {
      'echasnovski/mini.icons', version = false
    },
    config = function()
      require('mahadia.plugins.whichkey')
    end
  },
  -- Window Stuff
  { "szw/vim-maximizer",       event = 'BufRead', lazy = true }, -- maximized and restore current window
  -- extra plugins
  {
    "tpope/vim-surround",
    event = 'LazyFile'
  },
  {
    "echasnovski/mini.ai",
    event = "LazyFile",
    version = "*", -- Use latest stable version
    opts = {},     -- Empty opts table for default settings
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
    config = function()
      require("mahadia.plugins.flash")
    end,
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = true,
    event = 'LazyFile',
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require('mahadia.plugins.hardtime')
    end,
  },
  -- statusLine
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require('mahadia.plugins.lualine')
    end,
    event = 'LazyFile'
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('mahadia.plugins.harpoon')
    end
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = 'LazyFile'
  },
  {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "LazyFile",
    config = function()
      require('mahadia.plugins.autopairs')
    end
  },
  -- Terminal
  { --NOTE: Look into if i can replace this with snacks, only used for lazygit
    "akinsho/toggleterm.nvim",
    lazy = true,
    branch = "main",
    event = "VeryLazy",
    -- cmd = {
    --   "ToggleTerm",
    --   "TermExec",
    --   "ToggleTermToggleAll",
    --   "ToggleTermSendCurrentLine",
    --   "ToggleTermSendVisualLines",
    --   "ToggleTermSendVisualSelection",
    -- },
    config = function()
      require('mahadia.plugins.toggleterm')
    end
  },
  {
    'mbbill/undotree',
    event = 'LazyFile',
    config = function()
      require('mahadia.plugins.undotree')
    end
  },
  { 'farmergreg/vim-lastplace' },
  {
    "akinsho/bufferline.nvim",
    branch = "main",
    event = "LazyFile",
    config = function()
      require('mahadia.plugins.bufferline')
    end
  },
  {
    'norcalli/nvim-colorizer.lua',
    lazy = true,
    cmd = {
      "ColorizerToggle"
    }
  },
  {
    'rmagatti/auto-session',
    config = function()
      require('mahadia.plugins.autoSession')
    end
  },

  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    lazy = false
  },
  -- gitsigns
  {
    'lewis6991/gitsigns.nvim',
    event = 'LazyFile',
    lazy = true,
    config = function()
      require('mahadia.plugins.gitsigns')
    end
  },
  -- Cmp / Autocompletion
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      -- Snippet Collection (Optional)
      { 'rafamadriz/friendly-snippets' },
    },
    lazy = true,
    event = 'LazyFile',
    config = function()
      require('mahadia.plugins.lspZero')
    end
  },
  --vim-tmux-navigator
  {
    'christoomey/vim-tmux-navigator',
    event = "BufReadPre"

  },
  {
    "piersolenski/wtf.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    lazy = true,
    event = 'LazyFile',
    opts = {},
    keys = {
      -- {
      --   "gw",
      --   mode = { "n", "x" },
      --   function()
      --     require("wtf").ai()
      --   end,
      --   desc = "Debug diagnostic with AI",
      -- },
      {
        mode = { "n" },
        "gw",
        function()
          require("wtf").search()
        end,
        desc = "Search diagnostic with Google",
      },
    },
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = 'BufRead',
    lazy = true,
    config = function()
      require('mahadia.plugins.ufo')
    end
  },
  { 'metakirby5/codi.vim',     event = "CmdlineEnter", lazy = true },
  { 'dstein64/vim-startuptime' },
  {
    "zaldih/themery.nvim",
    config = function()
      require('mahadia.plugins.themery')
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require('mahadia.plugins.noice')
    end
  },
}

-- require("lazy").setup(plugins, { defaults = { lazy = true } })
require("lazy").setup(plugins, opts)
