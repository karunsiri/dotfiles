require('globals')
require('vim_options')
require('keymaps')
require('autocmds')
require('plugins')

vim.cmd('colorscheme onedark')

-- Set vim-airline section-z after plugin loads because the plugin function is
-- being called.
vim.g.airline_section_z = vim.fn['airline#section#create']({ '%3p%% ', 'linenr', ' '..':%3v' })
