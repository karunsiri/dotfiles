local utils = require('utils')

-- Toggle between Vim 'dark' and 'light' mode.
-- Some color schemes support dark and light mode. To enable toggling by a
-- keyboard shortcut while not having to type in code should make life easier.
local function toggle_background()
  local current_mode = vim.o.background

  if current_mode == 'dark' then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end

  utils.echo('Using '..vim.o.background..' mode')
end

vim.keymap.set('n', '<F8>', toggle_background, { noremap = true, silent = true })
