local utils = require('utils')
local cmd = vim.cmd

-- Remove trailing whitespace on save
cmd('autocmd BufWritePre * :%s/\\s\\+$//e')
cmd('autocmd FileType haml setlocal foldmethod=indent')
cmd('autocmd FileType eruby.yaml setlocal foldmethod=indent')

utils.create_augroup('vimrcEx', {
  -- When editing a file, always jump to the last known cursor position.
  -- Don't do it for commit messages, when the position is invalid, or when
  -- inside an event handler (happens when dropping a file on gvim).
  {
    'BufReadPost',
    '*',
    [[
        if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
    ]]
  },

  -- Set syntax for some filetypes
  { 'BufRead,BufNewFile', '*.md', 'set', 'filetype=markdown' },
  { 'BufRead,BufNewFile', '.{jscs,jshint,eslint}rc', 'set', 'filetype=json' },
  { 'BufRead,BufNewFile', 'vimrc.local', 'set', 'filetype=vim' },
  { 'BufRead,BufNewFile', 'tmux.conf.local', 'set', 'filetype=tmux' },
  { 'BufRead,BufNewFile', 'gitconfig.local', 'set', 'filetype=gitconfig' },
  {
    'BufRead,BufNewFile',
    [[
       aliases.local,
      \zshenv.local,zlogin.local,zlogout.local,zshrc.local,zprofile.local,
      \*/zsh/configs/*]],
    'set',
    'filetype=sh'
  },
})
