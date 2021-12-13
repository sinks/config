-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- languages
  use 'aklt/plantuml-syntax'
  use 'digitaltoad/vim-pug'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'alexaandru/nvim-lspupdate'
  use 'folke/lsp-colors.nvim'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- completion
  -- use 'hrsh7th/cmp-nvim-lsp'
  -- use 'hrsh7th/cmp-buffer'
  -- use 'hrsh7th/cmp-path'
  -- use 'hrsh7th/cmp-cmdline'
  -- use 'hrsh7th/nvim-cmp'
  use { 'ms-jpq/coq_nvim', branch = 'coq', run = ':COQdeps'} -- main one
  use { 'ms-jpq/coq.artifacts', branch= 'artifacts'} -- 9000+ Snippets

  -- lint and fixing
  -- use 'w0rp/ale'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- navigation
  use 'preservim/nerdtree'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- status line
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use 'b3nj5m1n/kommentary'
  use 'lambdalisue/gina.vim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Themes
  use {'dracula/vim', as = 'dracula'}
  use {'ishan9299/nvim-solarized-lua', as = 'solarized'}
  use "mcchrish/zenbones.nvim"
  use "rktjmp/lush.nvim"
end)
