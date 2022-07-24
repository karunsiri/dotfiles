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

  use 'joshdick/onedark.vim'
  use 'vim-airline/vim-airline'

  -- use {
  --   'nvim-lualine/lualine.nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  -- }
  -- require('lualine').setup(require('configs/lualine'))

  -- Define bundles via Github repos
  use 'christoomey/vim-run-interactive'
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
  use 'preservim/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'Yggdroot/indentLine'
  use 'easymotion/vim-easymotion'
  use 'karunsiri/vim-delete-hidden-buffers'
  use 'Konfekt/FastFold'
  use 'chrisbra/csv.vim'
  use {
    'python-mode/python-mode',
    ft = { 'python' },
    branch = 'develop',
  }
  use { 'mg979/vim-visual-multi', branch = 'master' }
  use { 'karunsiri/vim-golden-ratio', branch = 'minimum-width' }
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'
  use { 'neoclide/coc.nvim', branch = 'release' }
  use 'ryanoasis/vim-devicons'
  use 'hashivim/vim-terraform'
  use 'luochen1990/rainbow'
  use 'rust-lang/rust.vim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
