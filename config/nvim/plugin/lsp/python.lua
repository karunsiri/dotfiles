local configs = require('configs/lsp')

require('lspconfig').pyright.setup{
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
}
