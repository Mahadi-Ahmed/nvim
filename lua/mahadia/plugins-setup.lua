local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  -- Colorschemes
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
  })
  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'} )
  -- file explorer
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  })
  -- commenting with gc
	use("numToStr/Comment.nvim")
  -- Which Key
  use("folke/which-key.nvim")
  -- Window Stuff
  use("szw/vim-maximizer") -- maximized and restore current window
  -- extra plugins
  use("tpope/vim-surround")
  use("justinmk/vim-sneak")
  -- statusLine
  use("nvim-lualine/lualine.nvim")
	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
  use({ "ThePrimeagen/harpoon" }) -- Harpoon

  use { "windwp/nvim-autopairs" }
  use { "akinsho/toggleterm.nvim", tag = 'main'}
  use {'mbbill/undotree'}

 	-- Cmp / Autocompletion
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      -- Snippet Collection (Optional)
      {'rafamadriz/friendly-snippets'},
    }
  }

 	-- Cmp / Autocompletion
  -- use { "hrsh7th/nvim-cmp" } -- The completion plugin
  -- use { "hrsh7th/cmp-buffer" } -- buffer completions
  -- use { "hrsh7th/cmp-path" } -- path completions 
  --   -- Snippets
  --   use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
  --   use { "L3MON4D3/LuaSnip" } --snippet engine
  --   use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
