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

local lazy_options = {
  lockfile = vim.fn.stdpath('config') .. "/lazy-lock.json",
}

local plugins = {
  {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_style = 'atlantis'
      vim.g.sonokai_better_performance = 1
      vim.cmd[[colorscheme sonokai]]
    end,
  },

  -- Configurations for Nvim LSP
  'neovim/nvim-lspconfig',
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
    },
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
  },
  'williamboman/mason.nvim',
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'nvimdev/lspsaga.nvim'
    },
  },
  -- Aesthetics
  -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
  -- So for api plugins like devicons, we can always set lazy=true
  { "nvim-tree/nvim-web-devicons", lazy = true },
  'nvim-lualine/lualine.nvim',
  { 'akinsho/bufferline.nvim', tag = 'v4.4.0' },
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
    'junegunn/fzf',
    config = function() vim.fn['fzf#install']() end,
    dependencies = {
      'junegunn/fzf.vim',
    }
  },
  { 'janko-m/vim-test', ft = { 'ruby' } },
  { 'tpope/vim-bundler', ft = { 'ruby' } },
  { 'tpope/vim-projectionist', ft = { 'ruby' } },
  { 'tpope/vim-rails', ft = { 'ruby' } },
  { 'tpope/vim-rake', ft = { 'rake' } },
  'tpope/vim-repeat',
  'tpope/vim-surround',
  {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    dependencies = {
      'ray-x/cmp-treesitter',
      'RRethy/nvim-treesitter-endwise',
    },
  },
  'vim-scripts/tComment',
  'lukas-reineke/indent-blankline.nvim',
  'phaazon/hop.nvim',
  'karunsiri/vim-delete-hidden-buffers',
  'chrisbra/csv.vim',
  { 'mg979/vim-visual-multi', branch = 'master' },
  { 'beauwilliams/focus.nvim' },
  { 'hashivim/vim-terraform', ft = { 'terraform', 'tfvars' } },
  'luochen1990/rainbow',
  'nvim-tree/nvim-tree.lua',
  'akinsho/toggleterm.nvim',
  {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown' },
    config = function() vim.fn['mkdp#util#install']() end
  },
  'lewis6991/gitsigns.nvim',
  -- use { 'NvChad/nvim-colorizer.lua' }
  -- use 'norcalli/nvim-colorizer.lua'
  'karunsiri/nvim-colorizer.lua',
  -- use 'brenoprata10/nvim-highlight-colors'
}

return require('lazy').setup(plugins, lazy_options)
