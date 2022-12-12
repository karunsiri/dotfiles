local configs = require('configs/lsp')

require('lspconfig').gopls.setup({
  on_attach = configs.on_attach,
  capabilities = configs.capabilities
})
