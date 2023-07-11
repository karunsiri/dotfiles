require('globals')
require('vim_options')
require('keymaps')
require('autocmds')
require('plugins')
require('configs/lsp')
require('configs/color_overrides')
-- require('user/pymode')

vim.api.nvim_create_autocmd(
  { 'BufNewFile', 'BufRead' },
  {
    pattern = '*.mdx',
    command = [[setfiletype markdown]],
  }
)
