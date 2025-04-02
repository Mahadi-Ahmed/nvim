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
    -- lazy = false,
    -- priority = 1000,
    name = 'rose-pine',
    cmd = 'Themery'
  },
  { "ellisonleao/gruvbox.nvim", name = 'gruvbox',  cmd = 'Themery' },
  { "rebelot/kanagawa.nvim",    name = 'kanagawa', cmd = 'Themery' },
  {
    "folke/tokyonight.nvim",
    opts = {},
    cmd = 'Themery'
  },
  { "catppuccin/nvim",         name = "catppuccin", cmd = 'Themery' },
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
    event = "LazyFile",
    config = function()
      require('mahadia.plugins.treesitter')
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { "debugloop/telescope-undo.nvim" },
    },
    cmd = 'Telescope',
    config = function ()
      require('mahadia.plugins.telescope')
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
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    cmd = 'Oil'
  },
  -- commenting with gc
  {
    "numToStr/Comment.nvim",
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    dependencies = {
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        dependencies = 'nvim-treesitter/nvim-treesitter',
      }
    },
    config = function()
      require('mahadia.plugins.comment')
    end
  },
  -- Which Key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
      'echasnovski/mini.icons', version = false
    },
    config = function()
      require('mahadia.plugins.whichkey')
    end
  },
  -- Window Stuff
  { -- maximized and restore current window
    "szw/vim-maximizer",
    cmd = 'MaximizerToggle',
  },
  {
    "echasnovski/mini.surround",
    event = "LazyFile",
    config = function()
      require('mahadia.plugins.mini-surround')
    end,
  },
  {
    "echasnovski/mini.ai",
    event = "LazyFile",
    version = "*", -- Use latest stable version
    opts = {},     -- Empty opts table for default settings
  },
  {
    'folke/flash.nvim',
    event = "LazyFile",
    config = function()
      require("mahadia.plugins.flash")
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
    end,
    keys = {
      { "<leader>j", desc = "Harpoon" }
    }
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
  {
    "akinsho/toggleterm.nvim",
    branch = "main",
    event = "VeryLazy",
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
    end,
    cmd = { 'SessionRestore', 'SessionSave' }
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = 'LazyFile'
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
    opts = {},
    keys = {
      {
        "gw",
      },
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
    config = function()
      require('mahadia.plugins.ufo')
    end
  },
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
      "rcarriga/nvim-notify",
    },
    config = function()
      require('mahadia.plugins.noice')
    end
  },
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      { 'leoluz/nvim-dap-go', ft = { 'go' } },
      { 'mxsdev/nvim-dap-vscode-js', ft = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'astro', 'vue' } }
    },
    -- config = function()
    --   require('mahadia.plugins.dap')
    -- end,
    event = 'LazyFile'
  },
  {
    'microsoft/vscode-js-debug',
    version = '1.x',
    build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
    init = function()
      vim.fn.system { "git", "config", "--global", "--add", "safe.directory", vim.fn.stdpath "data" .. "/lazy/vscode-js-debug" }
      vim.fn.system { "git", "config", "-f", vim.fn.stdpath "data" .. "/lazy/vscode-js-debug/.git/config", "--add", "core.fileMode", "false" }
      vim.fn.system { "git", "-C", vim.fn.stdpath "data" .. "/lazy/vscode-js-debug", "update-index", "--assume-unchanged", "package-lock.json" }
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
  },
}

-- require("lazy").setup(plugins, { defaults = { lazy = true } })
require("lazy").setup(plugins, opts)
