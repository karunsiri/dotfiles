local map = require('utils').map

-- Quicker window movement
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })
map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })

map('n', '<Leader><Up>', ':vertical resize +10<CR>', { noremap = true, silent = true })
map('n', '<Leader><Down>', ':vertical resize -10<CR>', { noremap = true, silent = true })
map('n', '<Leader>gb', ':Git blame<CR>', { noremap = true, silent = true })
map('n', '<Leader>gs', ':Git status<CR>', { noremap = true, silent = true })
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

-- Run commands that require an interactive shell
map('n', '<Leader>r', ':RunInInteractiveShell<Space>', { noremap = true })

-- Ale linting error jump
map('n', '<Leader>p', ':ALENextWrap<CR>', { noremap = true })
map('n', '<Leader>.', ':ALEPreviousWrap<CR>', { noremap = true })

-- Easier tab navigation
map('n', 'GT', ':tabp<CR>', { noremap = true })
map('n', '<Leader>n', ':tabnew<CR>', { noremap = true })

-- Go to symbol definition
map('n', 'gd', '<Plug>(coc-definition)')

-- Rename all symbol references
map('n', '<F2>', '<Plug>(coc-rename)')

-- open ctags in split tab/screen
map('', '<C-\\>', ':vsp <CR>:exec("tag ".expand("<cword>"))<CR>')
map('', '<Leader><C-\\>', ':tab split<CR>:exec("tag ".expand("<cword>"))<CR>')

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

-- Tab to autocomplete text. Shift-Tab to autocomplete from bottom
-- will insert tab at beginning of line,
-- will use completion if not at beginning
-- vim.api.nvim_eval([[
vim.cmd([[
  function! CustomTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
      return "\<Tab>"
    else
      return "\<C-n>"
    endif
  endfunction
]])
map('i', '<S-Tab>', '<C-p>', { noremap = true })
map('i', '<Tab>', '<C-r>=CustomTabWrapper()<CR>', { noremap = true })

-- Show documentation in preview window.
-- vim.cmd([[
--   function! s:show_documentation()
--     if (index(['vim','help'], &filetype) >= 0)
--       execute 'h '.expand('<cword>')
--     else
--       call CocAction('doHover')
--     endif
--   endfunction
-- ]])
-- map('n', 'K', ':call <SID>show_documentation()<CR>', { noremap = true, silent = true })
map('n', 'K', ":call CocAction('doHover')<CR>", { noremap = true, silent = true })


-- Map Ctrl + p to open fuzzy find (FZF)
map('n', '<C-p>', ':Files<CR>', { noremap = true })
