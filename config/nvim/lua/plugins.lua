-- Bootstrap Lazy.nvim
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

local lazy_options = {}
local plugins = {
  -- Configurations for Nvim LSP
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'ray-x/cmp-treesitter',
  'hrsh7th/nvim-cmp',
  'williamboman/mason.nvim',

  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  { 'nvimdev/lspsaga.nvim',
    dependencies = {
      {'neovim/nvim-lspconfig'}
    }
  },
  -- Aesthetics
  'nvim-tree/nvim-web-devicons',
  'olimorris/onedarkpro.nvim',
  { 'nvim-lualine/lualine.nvim',
    dependencies = {
      {'nvim-tree/nvim-web-devicons', optional = true }
    }
  },
  { 'akinsho/bufferline.nvim', tag = 'v4.2.0' },
  { 'glepnir/dashboard-nvim' },
  { 'rose-pine/neovim', name = 'rose-pine', lazy = true },
  {
    'sainnhe/everforest',
    lazy = true,
    config = function()
      vim.g.everforest_background = 'hard'
    end
  },

  {
    'junegunn/fzf', config = function() vim.fn['fzf#install']() end
  },
  { 'junegunn/fzf.vim',
    dependencies = {
      { 'junegunn/fzf' }
    }
  },
  { 'janko-m/vim-test', ft = { 'ruby' } },
  { 'tpope/vim-bundler', ft = { 'ruby' } },
  { 'tpope/vim-projectionist', ft = { 'ruby' } },
  { 'tpope/vim-rails', ft = { 'ruby' } },
  { 'tpope/vim-rake', ft = { 'rake' } },
  'tpope/vim-repeat',
  'tpope/vim-rhubarb',
  'tpope/vim-surround',
  {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },
  'RRethy/nvim-treesitter-endwise',
  'vim-scripts/tComment',
  'lukas-reineke/indent-blankline.nvim',
  'phaazon/hop.nvim',
  'karunsiri/vim-delete-hidden-buffers',
  'chrisbra/csv.vim',
  { 'mg979/vim-visual-multi', branch = 'master' },
  'beauwilliams/focus.nvim',
  { 'hashivim/vim-terraform', ft = { 'terraform', 'tfvars' } },
  'luochen1990/rainbow',
  { 'nvim-tree/nvim-tree.lua',
    dependencies={
      { 'nvim-tree/nvim-web-devicons', optional = true }
    }
  },
  'akinsho/toggleterm.nvim',
  { 'iamcco/markdown-preview.nvim', ft = { 'markdown' }, config = function() vim.fn['mkdp#util#install']() end },
  'lewis6991/gitsigns.nvim',
  -- use { 'NvChad/nvim-colorizer.lua' }
  -- use 'norcalli/nvim-colorizer.lua'
  'karunsiri/nvim-colorizer.lua',
  -- use 'brenoprata10/nvim-highlight-colors'
}

return require('lazy').setup(plugins, lazy_options)
