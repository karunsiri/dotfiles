-- Bootstrap packer

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Configurations for Nvim LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'ray-x/cmp-treesitter'
  use 'hrsh7th/nvim-cmp'
  use 'williamboman/mason.nvim'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use { 'glepnir/lspsaga.nvim', branch = main }

  -- Aesthetics
  use 'nvim-tree/nvim-web-devicons'
  use 'olimorris/onedarkpro.nvim'
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
  use { 'akinsho/bufferline.nvim', tag = 'v3.1.0' }

  use { 'glepnir/dashboard-nvim' }
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use {
    'sainnhe/everforest',
    config = function()
      vim.g.everforest_background = 'hard'
    end
  }

  if (vim.fn.isdirectory("/usr/local/opt/fzf") ~= 0) then
    use '/usr/local/opt/fzf'
  else
    use { 'junegunn/fzf', run='./install --all' }
  end

  use 'junegunn/fzf.vim'
  use 'janko-m/vim-test'
  use 'tpope/vim-bundler'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-rails'
  use 'tpope/vim-rake'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'RRethy/nvim-treesitter-endwise'
  use 'vim-scripts/tComment'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'phaazon/hop.nvim'
  use 'karunsiri/vim-delete-hidden-buffers'
  use 'chrisbra/csv.vim'
  use { 'mg979/vim-visual-multi', branch = 'master' }
  use 'beauwilliams/focus.nvim'
  use 'hashivim/vim-terraform'
  use 'luochen1990/rainbow'
  use { 'nvim-tree/nvim-tree.lua', requires={ 'nvim-tree/nvim-web-devicons', opt = true } }
  use 'akinsho/toggleterm.nvim'
  use { 'iamcco/markdown-preview.nvim', ft = { 'markdown' }, run = function() vim.fn['mkdp#util#install']() end }
  use 'lewis6991/gitsigns.nvim'
  -- use { 'NvChad/nvim-colorizer.lua' }
  -- use 'norcalli/nvim-colorizer.lua'
  use 'karunsiri/nvim-colorizer.lua'
  -- use 'brenoprata10/nvim-highlight-colors'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
