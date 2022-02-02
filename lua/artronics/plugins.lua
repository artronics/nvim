local utils = require('artronics/utils')
local vim = vim
local packer = require'packer'

packer.startup(function()
  local use = packer.use
  use 'wbthomason/packer.nvim'
  use '907th/vim-auto-save'
  use 'tpope/vim-commentary'
  -- use 'tpope/vim-fugitive'
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use 'cohama/lexima.vim' -- auto closing quotes and brackets
  use 'machakann/vim-sandwich' -- soround with quotes and brackets
  use 'romainl/vim-cool' -- add no search highlight after move
  use 'doums/darcula' -- theme
  use 'arcticicestudio/nord-vim' -- theme
  use 'folke/tokyonight.nvim' -- theme
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      { 'nvim-treesitter/nvim-treesitter-textobjects'  }
    }
  }
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/popup.nvim'
  --completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
      { "onsails/lspkind-nvim" }
    }
  }
  use 'sheerun/vim-polyglot'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
    {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'lewis6991/gitsigns.nvim',
        requires = {
        'nvim-lua/plenary.nvim'
      },
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
  use 'kyazdani42/nvim-web-devicons'
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'nvim-tree'.setup {} end
  }
  use {
    'ziglang/zig.vim'
  }
end
)

vim.cmd('colorscheme tokyonight')

-- git
local neogit = require('neogit')
neogit.setup {}

vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_quit_on_open = 1
require'nvim-tree'.setup {
    view = {
        width = 30
    }
}
utils.keymap('n', '<M-0>', ':NvimTreeToggle<CR>')
utils.keymap('n', '<C-Left>', ':NvimTreeFindFileToggle<CR>') -- reveal current file in tree

