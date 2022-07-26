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
  use 'hrsh7th/nvim-cmp'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use 'joshdick/onedark.vim'
  use 'rakr/vim-one'
  use 'vim-airline/vim-airline'

  if (vim.fn.isdirectory("/usr/local/opt/fzf") ~= 0) then
    use '/usr/local/opt/fzf'
  else
    use { 'junegunn/fzf', run='./install --all' }
  end

  use 'junegunn/fzf.vim'
  use 'janko-m/vim-test'
  use 'pangloss/vim-javascript'
  use 'pbrisbin/vim-mkdir'
  use 'tpope/vim-bundler'
  use 'tpope/vim-endwise'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-rails'
  use 'tpope/vim-rake'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'vim-ruby/vim-ruby'
  use 'vim-scripts/tComment'
  use 'dense-analysis/ale'
  use 'Yggdroot/indentLine'
  use 'easymotion/vim-easymotion'
  use 'karunsiri/vim-delete-hidden-buffers'
  use 'Konfekt/FastFold'
  use 'chrisbra/csv.vim'
  use { 'python-mode/python-mode', ft = { 'python' }, branch = 'develop' }
  use { 'mg979/vim-visual-multi', branch = 'master' }
  use { 'karunsiri/vim-golden-ratio', branch = 'minimum-width' }
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'
  use 'hashivim/vim-terraform'
  use 'luochen1990/rainbow'
  use 'rust-lang/rust.vim'
  use { 'kyazdani42/nvim-tree.lua', requires={ 'kyazdani42/nvim-web-devicons' } }
  use 'akinsho/toggleterm.nvim'
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
