local ok, onedarkpro = pcall(require, 'onedarkpro')
if not ok then
  return
end

require('onedarkpro').setup({
  dark_theme = 'onedark',
  light_theme = 'onelight',
  highlights = {
    toggleterm = {},
  },
})
