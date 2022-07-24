return {
  sections = {
    lualine_b = { 'branch', 'diagnostics' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'filetype', '%l:%L' },
  },
  inactive_sections = {
    lualine_c = { 'filename', 'filetype' },
    lualine_x = {},
  },
  tabline = {
    lualine_a = { 'buffers' },
  },
}
