require('globals')
require('vim_options')
require('keymaps')
require('autocmds')
require('configs/color_overrides')
require('plugins')
require('configs/lsp')
-- require('user/pymode')

vim.api.nvim_create_autocmd(
  { 'BufNewFile', 'BufRead' },
  {
    pattern = '*.mdx',
    command = [[setfiletype markdown]],
  }
)
