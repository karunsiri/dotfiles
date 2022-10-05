local o = vim.opt
local options = {
  -- Automatically :write before running commands
  autowrite = true,

  -- Backspace deletes like most programs in insert mode
  backspace = { 'indent', 'eol', 'start' },
  backup = false,
  colorcolumn = '+1',
  expandtab = true,
  history = 50,
  ignorecase = true,
  incsearch = true,
  joinspaces = false,
  number = true,
  relativenumber = true,
  list = true,
  listchars = 'tab:»·,trail:·,nbsp:·',
  shiftround = true,
  shiftwidth = 2,
  smartcase = true,
  softtabstop = 2,
  tabstop = 2,
  textwidth = 80,
  wrap = false,
  writebackup = false,
  autoindent = true,
  formatoptions = o.formatoptions - { 't' },
  cursorline = true,
  completeopt = 'menu,menuone,noselect',

  -- Don't show vim command box
  ch = 0,

  -- Always display the status line
  laststatus = 2,

  -- Disable modelines as a security precaution
  modelines = 0,
  modeline = false,

  -- Show the cursor position all the time
  ruler = true,

  -- Display incomplete commands
  showcmd = true,

  -- http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
  swapfile = false,

  -- Set default foldmethod. Not every syntax has folding set
  foldmethod = 'indent',
  foldnestmax = 10,
  foldenable = false,
  foldlevel = 1,
  showmode = false,

  -- Tab completion
  -- will insert tab at beginning of line,
  -- will use completion if not at beginning
  wildmode= { 'list:longest', 'list:full' },

  -- Set tags for vim-fugitive
  -- TODO: Check this
  tags = o.tags ^ { '.git/tags' },
  splitbelow = true,
  splitright = true,

  -- Set spellfile to location that is guaranteed to exist, can be symlinked to
  -- Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
  spellfile = '$HOME/.vim-spell-en.utf-8.add',

  -- Use Ag over Grep
  grepprg = 'ag --nogroup --nocolor',
}

for k, v in pairs(options) do
  o[k] = v
end

o.sessionoptions:append { 'globals' }
-- Autocomplete with dictionary words when spell check is on
o.complete:append { 'kspell' }

-- Always use vertical diffs
o.diffopt:append { 'vertical' }

if vim.fn.has('termguicolors') then
  o.termguicolors = true
end

-- Use ag in fzf for listing files. Lightning fast and respects .gitignore
vim.env.FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'
