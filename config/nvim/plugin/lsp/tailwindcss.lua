local configs = require('configs/lsp')

require('lspconfig').tailwindcss.setup({
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})
