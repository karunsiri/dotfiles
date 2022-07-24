local g = vim.g
local eval = vim.api.nvim_eval

g.mapleader = " "

-- When the type of shell script is /bin/sh, assume a POSIX-compatible
-- shell for syntax highlighting purposes.
g.is_posix = 1

-- easymotion configs
g.EasyMotion_smartcase = 1

-- Treat <li> and <p> tags like the block tags they are
g.html_indent_tags = 'li\\|p'

-- Pymode settings & key mappings
g.pymode_lint_on_write = 0
g.pymode_lint_unmodified = 1
g.pymode_lint_on_fly = 1
g.pymode_lint_cwindow = 0
g.pymode_rope = 1
g.pymode_rope_completion_bind = '<Tab>'

g.one_allow_italics = 1

-- FastFold configuration
g.fastfold_savehook = 0
g.fastfold_fold_command_suffixes = { 'x','X','a','A','o','O','c','C' }
g.ruby_fold = 1
g.eruby_fold = 1

-- Enable these coc extensions
g.coc_global_extensions = {
  'coc-css',
  'coc-eslint',
  'coc-json',
  'coc-tsserver',
}

-- Stick <C-P> (FZF) result at the 50% bottom portion of the screen
g.fzf_layout = { down = '70%' }
g.rainbow_active = 1
g.rainbow_conf = {
  guifgs = { 'coral', 'aquamarine3', 'MediumPurple3', 'burlywood3' },
  separately = { nerdtree = 0 },
}

-- vim-airline themed tabline
g['airline#extensions#default#layout'] = {
  { 'a', 'b', 'c' },
  { 'x', 'z', 'error', 'warning' }
}

if not vim.fn.exists('g:airline_symbols') then
  g.airline_symbols = {}
end

g['airline#extensions#tabline#enabled'] = 1
g['airline#extensions#tabline#show_splits'] = 0
g['airline#extensions#tabline#show_buffers'] = 0
g['airline_powerline_fonts'] = 1
g['airline_symbols.linenr'] = ''
