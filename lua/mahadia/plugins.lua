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

-- Install your plugins here
local plugins = {
  -- My plugins here
  { "folke/lazy.nvim",      tag = "stable" },
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
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
    event = "User FileOpened",
  },
  { 'windwp/nvim-ts-autotag' },
  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  },
  -- commenting with gc
  {
    "numToStr/Comment.nvim",
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    event = "User FileOpened",
  },
  -- Which Key
  {
    "folke/which-key.nvim",
    cmd = "WhichKey",
    event = "VeryLazy",
    dependencies = {
      'echasnovski/mini.icons', version = false
    }
  },
  -- Window Stuff
  { "szw/vim-maximizer" }, -- maximized and restore current window
  -- extra plugins
  {
    "tpope/vim-surround",
  },
  { "justinmk/vim-sneak" },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {}
  },
  -- statusLine
  { "nvim-lualine/lualine.nvim" },
  -- fuzzy finding w/ telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { { 'nvim-lua/plenary.nvim' }, { 'nvim-telescope/telescope-fzf-native.nvim' } }
  },
  { "nvim-telescope/telescope-fzf-native.nvim",    build = "make",                                  lazy = true },
  { "ThePrimeagen/harpoon" },

  { 'JoosepAlviste/nvim-ts-context-commentstring', dependencies = 'nvim-treesitter/nvim-treesitter' },
  { "windwp/nvim-autopairs" },
  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    branch = "main",
    event = "VeryLazy",
    cmd = {
      "ToggleTerm",
      "TermExec",
      "ToggleTermToggleAll",
      "ToggleTermSendCurrentLine",
      "ToggleTermSendVisualLines",
      "ToggleTermSendVisualSelection",
    },
    -- keys = lvim.builtin.terminal.open_mapping,
    -- enabled = lvim.builtin.terminal.active,
  },
  { 'mbbill/undotree' },
  { 'farmergreg/vim-lastplace' },
  {
    "akinsho/bufferline.nvim",
    branch = "main",
    event = "User FileOpened",
  },
  {
    'norcalli/nvim-colorizer.lua',
    lazy = true,
    cmd = {
      "ColorizerToggle"
    }
  },
  { 'rmagatti/auto-session' },

  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- require'alpha'.setup(require'alpha.themes.dashboard'.config)
      require 'alpha'.setup(require 'alpha.themes.theta'.config)
      -- require'alpha'.setup(require'alpha.themes.startify'.config)
    end,
    event = "VimEnter"
  },

  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  -- Lua
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
  { 'lewis6991/gitsigns.nvim', lazy = true },
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
    }
  },
  --vim-signature is a plugin to place, toggle and display marks.
  { 'kshenoy/vim-signature' },

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
  -- https://github.com/stevearc/dressing.nvim
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  { 'kevinhwang91/nvim-ufo',   dependencies = 'kevinhwang91/promise-async', event = "VeryLazy" },
  { 'metakirby5/codi.vim',     event = "VeryLazy" },
  { 'dstein64/vim-startuptime' },
  { "zaldih/themery.nvim",     lazy = true },
}

-- require("lazy").setup(plugins, { defaults = { lazy = true } })
require("lazy").setup(plugins, opts)
