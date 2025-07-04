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
  -- {
  --   'navarasu/onedark.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     local onedark = require('onedark')
  --     onedark.setup {
  --       style = 'dark',
  --       toggle_style_key = "<F7>",
  --       toggle_style_list = { 'warm', 'light' },
  --       colors = {
  --         gray = '#5a616d',
  --       },
  --       code_style = {
  --         comments = 'italic',
  --       },
  --       highlights = {
  --         ["@variable.member.ruby"] = { fg = '$orange' },
  --         ["@keyword.function.ruby"] = { fg = '$red' },
  --         ["@property.json"] = { fmt = 'italic' },
  --         ["@boolean.ruby"] = { fg = '$orange', fmt = 'italic' },
  --         ["@constant.builtin.ruby"] = { fg = '$orange', fmt = 'bold,italic' },
  --         ["@constant.builtin.json"] = { fg = '$orange', fmt = 'bold' },
  --         ["@variable.member.ruby"] = { fg = '$orange' },
  --         ["@keyword.modifier.ruby"] = { fg = '$red' },
  --         ["@boolean.ruby"] = { fg = '$orange', fmt = 'italic' },
  --         ["@boolean.lua"] = { fg = '${orange}', fmt = 'italic' },
  --         ["@boolean.toml"] = { fg = '${orange}', fmt = 'italic' },
  --         ["@constant.builtin.json"] = { fg = '${purple}', bold = true, fmt = 'italic' },
  --         ["@lsp.type.property.terraform"] = { fg = '${red}', fmt = 'italic' },
  --         ["@lsp.type.parameter.terraform"] = { fg = '${cyan}', fmt = 'italic' },
  --         ["@variable.builtin.terraform"] = { fg = '${yellow}' },
  --       }
  --     }
  --     onedark.load()
  --   end
  -- },

  {
    'olimorris/onedarkpro.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local variant = 'onedark'
      local onedark = require('onedarkpro')
      onedark.setup {
        options = {
          cursorline = true,
        },
        colors = {
          onedark = { bg = "#2C2D30" },
          light_gray = "#A8A8A8",
          dark_gray = "#748A9A",
        },
        styles = {
          comments = "italic",
        },
        highlights = {
          Comment = {
            fg = {
              onedark = '${dark_gray}',
              onelight = '${light_gray}',
            },
            italic = true,
            bold = false,
          },
          ["@variable.ruby"] = {},
          ["@variable.member.ruby"] = { fg = '${orange}' },
          ["@keyword.function.ruby"] = { fg = '${red}' },
          ["@keyword.modifier.ruby"] = { fg = '${red}' },
          ["@function.builtin.ruby"] = { fg = '${cyan}' },
          ["@boolean.ruby"] = { fg = '${orange}', italic = true },
          ["@string.special.symbol.ruby"] = { fg = '${cyan}' },
          ["@boolean.lua"] = { fg = '${orange}', italic = true },
          ["@boolean.toml"] = { fg = '${orange}', italic = true },
          ["@constant.builtin.json"] = { fg = '${purple}', bold = true, italic = true },

          ["@lsp.type.property.terraform"] = { fg = '${red}', italic = true },
          ["@lsp.type.parameter.terraform"] = { fg = '${cyan}', italic = true },
          ["@variable.builtin.terraform"] = { fg = '${yellow}' },
        },
      }
      vim.cmd[[colorscheme onedark]]
    end
  },

  -- Configurations for Nvim LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'nvimdev/lspsaga.nvim'
    },
  },
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
  -- Aesthetics
  -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
  -- So for api plugins like devicons, we can always set lazy=true
  { "nvim-tree/nvim-web-devicons", lazy = true },
  'nvim-lualine/lualine.nvim',
  { 'akinsho/bufferline.nvim', tag = 'v4.9.1' },
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
  'github/copilot.vim',
}

return require('lazy').setup(plugins, lazy_options)
