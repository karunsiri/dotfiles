local o = vim.opt

if vim.fn.has('termguicolors') then
  o.termguicolors = true
end

-- Automatically :write before running commands
o.autowrite = true

-- Backspace deletes like most programs in insert mode
o.backspace = { 'indent', 'eol', 'start' }
o.backup = false
o.colorcolumn = '+1'
o.expandtab = true
o.history = 50
o.ignorecase = true
o.incsearch = true
o.joinspaces = false
o.number = true
o.relativenumber = true
o.numberwidth = 5
o.list = true
o.listchars = 'tab:»·,trail:·,nbsp:·'
o.shiftround = true
o.shiftwidth = 2
o.smartcase = true
o.softtabstop = 2
o.tabstop = 2
o.textwidth = 80
o.wrap = false
o.writebackup = false
o.autoindent = true
o.formatoptions = o.formatoptions - { 't' }
o.cursorline = true
o.completeopt = 'menu,menuone,noselect'
o.sessionoptions:append { 'globals' }

-- Always display the status line
o.laststatus = 2

-- Disable modelines as a security precaution
o.modelines = 0
o.modeline = false

-- Show the cursor position all the time
o.ruler = true

-- Display incomplete commands
o.showcmd = true

-- http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
o.swapfile = false

-- Set default foldmethod. Not every syntax has folding set
o.foldmethod = 'indent'
o.foldnestmax = 10
o.foldenable = false
o.foldlevel = 1
o.showmode = false

-- Tab completion
-- will insert tab at beginning of line,
-- will use completion if not at beginning
o.wildmode= { 'list:longest', 'list:full' }

-- Set tags for vim-fugitive
-- TODO: Check this
o.tags = o.tags ^ { '.git/tags' }
o.splitbelow = true
o.splitright = true

-- Set spellfile to location that is guaranteed to exist, can be symlinked to
-- Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
o.spellfile = '$HOME/.vim-spell-en.utf-8.add'

-- Autocomplete with dictionary words when spell check is on
o.complete:append { 'kspell' }

-- Always use vertical diffs
o.diffopt:append { 'vertical' }

-- Use Ag over Grep
o.grepprg = 'ag --nogroup --nocolor'

-- Use ag in fzf for listing files. Lightning fast and respects .gitignore
vim.env.FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'
