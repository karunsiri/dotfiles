local configs = require('configs/lsp')

require('lspconfig').solargraph.setup({
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})
