local utils = require('utils')
local colors = {
  light = {
    BufferLineBackground = {
      guifg = '#2d2d2d',
      guibg = '#c5c5c5',
    },
    BufferLineBufferSelected = {
      guifg = '#2d2d2d',
      guibg = '#FAFAFA',
    },
    BufferLineModifiedSelected = {
      guibg = '#FAFAFA',
    },
    BufferLineModified = {
      guibg = '#c5c5c5',
    },
    BufferLineSeparatorSelected = {
      guifg = '#2d2d2d',
      guibg = '#FAFAFA',
    },
    BufferLineSeparator = {
      guifg = '#2d2d2d',
      guibg = '#c5c5c5',
    },
    BufferLineNumbersSelected = {
      guifg = '#2d2d2d',
      guibg = '#FAFAFA',
    },
    BufferLineNumbers = {
      guifg = '#2d2d2d',
      guibg = '#c5c5c5',
    }
  },
  dark = {
    BufferLineTab = {
      guibg = '#1e2127',
    },
    BufferLineTabSelected = {
      guibg = '#282c34',
    },
  },
}

local function use_bufferline()
  local ok, _ = pcall(require, 'bufferline')
  return ok
end

local function set_bufferline_tab_colors(color)
  if not use_bufferline() then
    return
  end

  local background = vim.o.background
  for kind, overrides in pairs(colors[background]) do
    local highlight_group = {}
    for target, color in pairs(overrides) do
      table.insert(highlight_group, string.format('%s=%s', target, color))
    end

    vim.cmd(string.format([[highlight %s %s]], kind, table.concat(highlight_group, ' ')))
  end
end

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

  set_bufferline_tab_colors(vim.o.background)
  utils.echo('Using '..vim.o.background..' mode')
end

vim.keymap.set('n', '<F8>', toggle_background, { noremap = true, silent = true })
