require('globals')
require('vim_options')
require('keymaps')
require('autocmds')
require('plugins')
require('user/colors')
require('user/toggleterm')

-- Set vim-airline section-z after plugin loads because the plugin function is
-- being called.
vim.g.airline_section_z = vim.fn['airline#section#create']({ '%3p%% ', 'linenr', ' '..':%3v' })
