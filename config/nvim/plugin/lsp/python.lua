local configs = require('configs/lsp')

vim.lsp.config('pyright', {
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})

vim.lsp.enable('pyright')
