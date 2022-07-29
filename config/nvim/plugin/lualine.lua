require('lualine').setup({
  options = {
    theme = 'seoul256',
  },
  sections = {
    lualine_b = { 'branch' },
    lualine_c = {
      { 'filename', path = 1, file_status = false }
    },
    lualine_x = { 'diagnostics', 'filetype' },
  }
})
