local configs = require('configs/lsp')

require('lspconfig').stylelint_lsp.setup({
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})
