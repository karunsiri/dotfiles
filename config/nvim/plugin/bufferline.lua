local ok, bufferline = pcall(require, 'bufferline')
if not ok then
  return
end

bufferline.setup({
  options = {
    separator_style = 'slant',
    mode = 'tabs',
    numbers = 'ordinal',
    close_icon = '',
    modified_icon = '●',
    left_trunc_marker = '',
    buffer_close_icon = '',
    right_trunc_marker = '',
    enforce_regular_tabs = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    always_show_bufferline = false,
    max_prefix_length = 15,
    max_name_length = 18,
    tab_size = 18,
  },
})

local map = vim.keymap.set
local opts = { noremap = true }

local function move_tab_left()
  vim.cmd[[tabm -1]]
  bufferline.sort_buffers_by('tabs')
end
local function move_tab_right()
  vim.cmd[[tabm +1]]
  bufferline.sort_buffers_by('tabs')
end

map('n', '<C-Right>', move_tab_right, opts)
map('n', 'GT', function() bufferline.cycle(-1) end, opts)
map('n', '<C-Left>', move_tab_left, opts)
