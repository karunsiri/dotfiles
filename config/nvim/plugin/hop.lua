local hop = require('hop')
hop.setup()

local opts = { noremap = true, buffer = 0 }
vim.keymap.set('n', '<Leader><Leader>s', function() hop.hint_char1() end, opts)
vim.keymap.set('n', '<Leader><Leader>w', function() hop.hint_words() end, opts)
