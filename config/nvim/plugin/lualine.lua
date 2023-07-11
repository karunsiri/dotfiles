local ok, lualine = pcall(require, 'lualine')
if not ok then
  return
end

lualine.setup({
  sections = {
    lualine_b = { 'branch' },
    lualine_c = {
      { 'filename', path = 1, file_status = false }
    },
    lualine_x = { 'diagnostics', 'filetype' },
  }
})
