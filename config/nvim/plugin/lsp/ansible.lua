local configs = require('configs/lsp')

require('lspconfig').ansiblels.setup({
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})
