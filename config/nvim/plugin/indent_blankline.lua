local ok, indent = pcall(require, 'indent_blankline')
if not ok then
  return
end

indent.setup {
  show_current_context = true,
}
