- [x] Add nvim tree for file explorer
- [x] Add Harpoon
  - [x] Increase size of harpoon menu window
- [x] Fix yank highlight
- [x] vim-maximizer - Toggle split window between maximized and split
- [x] which key - so i can see all keybinds
- [x] Fix formating with leader l f 
- [x] [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) use this plugin to auto close html tags
- [x] nvim undo tree - https://github.com/mbbill/undotree
- [x] Fix folds & folding
- [x] create fallback for leader f to find files if vim is used in a non git folder
- [] add [markdown preview plugin](https://github.com/iamcco/markdown-preview.nvim)
- [] Fix so you can see workspace diagnstics (look into leader l w in lvim)

  - [] create persistent undotree
- [] Migrate to [Lazy](https://github.com/folke/lazy.nvim)
- [x] Customize Lualine
  - [] list amount of lsp servers running 

- [] Fix the title string
- [x] Add integration to gitsigns(https://github.com/lewis6991/gitsigns.nvim)

- [x] Add colorizer to show hex colors[colorizer](https://github.com/norcalli/nvim-colorizer.lua)
  - [x] Add a command to turn on & off the colorizer in whichkey

- [x] [Bufferline - buffer tab plugin](https://github.com/akinsho/bufferline.nvim)
  Continue customizing the config for bufferline
  - [] fix so each split has its own bufferline
  - [x] Fix bufferline background
  - [x] Add command to close buffer
  - [x] Add command to select buffer to close 
  - [x] Add keybindings & map then in whichkey

### Look into null-ls
- [] Configure [Null-ls](https://www.youtube.com/watch?v=e3xxkEbhG0o)

### Telescope
- [] Telescope find text window [theme](https://github.com/nvim-telescope/telescope.nvim#themes) 
- [] Telescope: Fix so you can find files that are in gitignore
- [x] Telescope: leader f - mirror how it works in lunarvim 1.2

- [x] Fix transparent background 
- [x] Create a autocmd file to be able to set highlight as an option
      highlight norma ctermbg=none guibg=none

#### Interesting plugins to look into later
- [x] vim-surround - https://github.com/tpope/vim-surround
- [] replaceWithRegister - https://github.com/vim-scripts/ReplaceWithRegister
- [] lsp saga, preview defenition before jumping into it - https://github.com/glepnir/lspsaga.nvim
- [] vim-targets - https://github.com/wellle/targets.vim
- [] nvim-spectre - [search and replace](https://github.com/nvim-pack/nvim-spectre) 
- [] trailblazer, stack based mark system(https://github.com/LeonHeidelbach/trailblazer.nvim)

### Nvim Tree Settings & Configuration
- [x] Make it so if you toggle the explorer when a file is open it opens up nvim-tree navigates to that folder
- [x] Remove .git folder from explorer view (Propbably no need to implement this)
- [x] Fix so if you open a file directly nvimtree does not open first
- [] Change so the tree doesnt use symbols instead it highlights the color of the name of of file if its dirty/new in git

### Toggleterm
- [] Refactor toggleterm to open different terminal instances depending on keybinding pressed
- [x] toggleterm - terminal windows inside vim
- [x] Add intigration to lazygit

# Resources & Inspo
* [Lunarvim repo](https://www.lunarvim.org/)
* [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)
* [nvim-basic-ide](https://github.com/LunarVim/nvim-basic-ide)
* [Josean Martinez Youtube Video](https://www.youtube.com/watch?v=vdn_pKJUda8&list=LL&index=1)
* Look at min 18 in ThePrimeagen video [ThePrimeagen Youtube Video](https://www.youtube.com/watch?v=w7i4amO_zaE&list=LL)
* [lspzero](https://github.com/VonHeikemen/lsp-zero.nvim)
* [ftplugin](https://neovim.io/doc/user/filetype.html) & [usage of ftplugin](https://www.reddit.com/r/neovim/comments/x3zp6t/usage_of_afterftplugin_directory_for/)


---
Startup times with packer:
190
207
220
253
260
199
266
211
--- 
Startup time with lazy
