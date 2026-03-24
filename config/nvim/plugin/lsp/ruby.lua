local configs = require('configs/lsp')

vim.lsp.config('ruby_lsp', {
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})
vim.lsp.enable('ruby_lsp')
