local ok, indent = pcall(require, 'ibl')
if not ok then
  return
end

indent.setup {
  indent = {
    char = '│',
  },
  exclude = {
    filetypes = { 'dashboard' },
  },
}
