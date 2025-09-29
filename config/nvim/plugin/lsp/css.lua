local configs = require('configs/lsp')

vim.lsp.config('stylelint_lsp', {
  filetypes = {
    'css',
    'scss'
  },
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})

vim.lsp.enable('stylelint_lsp')
