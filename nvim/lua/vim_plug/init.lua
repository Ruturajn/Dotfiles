local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

--> Colour Highlighting
Plug 'ap/vim-css-color'

--> Shell Script formatting
Plug ('z0mbix/vim-shfmt',  {['for'] = 'sh'})

--> File Icons
Plug 'kyazdani42/nvim-web-devicons'

--> File Tree
Plug 'kyazdani42/nvim-tree.lua'

--> Colorsheme
Plug ('catppuccin/nvim', {['as'] = 'catppuccin'})

--> Language Server Support
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

--> Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'
Plug 'L3MON4D3/LuaSnip'

--> Notifications
Plug 'rcarriga/nvim-notify'

--> Lualine
Plug 'nvim-lualine/lualine.nvim'

--> Basic Lua Libs
Plug 'nvim-lua/plenary.nvim'

--> BarBar for Tabs
Plug 'romgrk/barbar.nvim'

--> Nvim tree-Sitter
Plug ('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

--> Startup Page
Plug 'goolord/alpha-nvim'

--> LSP Language Server Installer
Plug "williamboman/nvim-lsp-installer"

--> Commenting Files
Plug 'tpope/vim-commentary'

--> Git support Plugin
Plug 'tpope/vim-fugitive'

vim.call('plug#end')
