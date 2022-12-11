local ok, onedarkpro = pcall(require, 'onedarkpro')
if not ok then
  return
end

onedarkpro.setup({
  options = {
    cursorline = true,
  },
  highlights = {
    toggleterm = {},
  },
})
