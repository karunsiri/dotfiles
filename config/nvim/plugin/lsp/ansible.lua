local configs = require('configs/lsp')

vim.lsp.config('ansiblels', {
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})

vim.lsp.enable('ansiblels')
