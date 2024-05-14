- [] Optimize config, use nvim --startuptime saveOutput.txt to help analyze
- [] Add [Themery](https://github.com/zaldih/themery.nvim) to be able to change themes fast
- [x] Add nvim tree for file explorer
- [x] Add Harpoon
  - [] Migrate to harpoon2 (https://github.com/ThePrimeagen/harpoon/tree/harpoon2?tab=readme-ov-file)
  - [x] Increase size of harpoon menu window
- [x] Fix yank highlight
- [x] vim-maximizer - Toggle split window between maximized and split
- [x] which key - so i can see all keybinds
- [x] Fix formating with leader l f 
- [x] [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) use this plugin to auto close html tags
- [x] nvim undo tree - https://github.com/mbbill/undotree
- [x] Fix folds & folding
- [x] create fallback for leader f to find files if vim is used in a non git folder
- [x] add snippets functionality via lspZero [Add an external collection of snippets](https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/autocomplete.md#add-an-external-collection-of-snippets)
- [] Try out this [fold](https://old.reddit.com/r/neovim/comments/16xz3q9/treesitter_highlighted_folds_are_now_in_neovim/) after updating neovim
- [x] Fix so you can see workspace diagnostics (look into leader l w in lvim)
- [x] make the command <leader> st live grep ignore stuff in lock files
- [] create a keymap for :%!jq . to format json

- [x] create persistent undotree
- [x] Migrate to [Lazy](https://github.com/folke/lazy.nvim)
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
- [x] Telescope: Fix so you can find files that are in gitignore
- [x] Telescope: leader f - mirror how it works in lunarvim 1.2

- [x] Fix transparent background 
- [x] Create a autocmd file to be able to set highlight as an option
      highlight norma ctermbg=none guibg=none

#### Interesting plugins to look into later
- [x] vim-surround - https://github.com/tpope/vim-surround
- [] replaceWithRegister - https://github.com/vim-scripts/ReplaceWithRegister
- [] lsp saga, preview defenition before jumping into it - https://github.com/glepnir/lspsaga.nvim
- [] nvim-spectre - [search and replace](https://github.com/nvim-pack/nvim-spectre) 
- [] trailblazer, stack based mark system(https://github.com/LeonHeidelbach/trailblazer.nvim)
- [] actions-preview - preview lsp code actions(https://github.com/aznhe21/actions-preview.nvim)
- [] BufferTabs - an unusual bufferline (https://github.com/tomiis4/BufferTabs.nvim)
- [x] autoSession - auto-session will try to restore an existing session for the current cwd if one exists.(https://github.com/rmagatti/auto-session)
- [] nvim-focus - Always have a nice view over your split windows(https://github.com/nvim-focus/focus.nvim)
- [] vim-sort-motion - ability to sort in Vim using text objects and motions(https://github.com/christoomey/vim-sort-motion)
- [x] dressing.nvim - for amazing aesthetics(https://github.com/stevearc/dressing.nvim)
- [x] wtf.nvim - A Neovim plugin to help you work out what the fudge that diagnostic means and how to fix it!(https://github.com/piersolenski/wtf.nvim)

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
