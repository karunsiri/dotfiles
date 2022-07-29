local map = require('utils').map

-- Quicker window movement
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })
map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })

map('n', '<Leader><Up>', ':vertical resize +10<CR>', { noremap = true, silent = true })
map('n', '<Leader><Down>', ':vertical resize -10<CR>', { noremap = true, silent = true })
map('n', '<C-t><C-t>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
map('n', '<C-t><C-f>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
map('n', '<Leader>w', ':w<CR>', { noremap = true })
map('n', '<Leader>q', ':q<CR>', { noremap = true })
map('n', '<Leader>bd', ':DeleteHiddenBuffers<CR>:echoe "Hidden Buffers Deleted"<CR>', { noremap = true, silent = true })

-- Switch between the last two files
map('n', '<Leader><Tab>', '<C-^>', { noremap = true })

-- vim-test mappings
map('n', '<Leader>t', ':TestFile<CR>', { noremap = true, silent = true })
map('n', '<Leader>s', ':TestNearest<CR>', { noremap = true, silent = true })
map('n', '<Leader>l', ':TestLast<CR>', { noremap = true, silent = true })
map('n', '<Leader>a', ':TestSuite<CR>', { noremap = true, silent = true })
map('n', '<Leader>gt', ':TestVisit<CR>', { noremap = true, silent = true })

-- Ale linting error jump
map('n', '<Leader>p', ':ALENextWrap<CR>', { noremap = true })
map('n', '<Leader>.', ':ALEPreviousWrap<CR>', { noremap = true })

-- Easier tab navigation
map('n', 'GT', ':tabp<CR>', { noremap = true })
map('n', '<Leader>n', ':tabnew<CR>', { noremap = true })

map('n', 'zuz', '<Plug>(FastFoldUpdate)')

-- omnicomplete vim-like navigation override
map('i', '<C-k>', "pumvisible() ? '<C-p>' : '<C-k>'", { noremap = true, expr = true })
map('i', '<C-j>', "pumvisible() ? '<C-n>' : '<C-j>'", { noremap = true, expr = true })

-- Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if (vim.fn.exists(':Ag') == 0) then
  vim.api.nvim_create_user_command(
    'Ag',
    'grep <args>|cwindow|redraw!',
    { nargs='+', complete='file', bar=true }
  )

  -- Map \ to use ag to do full text search
  map('n', '\\', ':Ag<SPACE>', { noremap = true })
end

-- Map Ctrl + p to open fuzzy find (FZF)
map('n', '<C-p>', ':Files<CR>', { noremap = true })
