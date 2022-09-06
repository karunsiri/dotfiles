local configs = require('configs/lsp')

require('lspconfig').stylelint_lsp.setup({
  filetypes = {
    'css',
    'scss'
  },
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})
