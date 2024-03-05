local configs = require('configs/lsp')

require('lspconfig').terraformls.setup({
  filetypes = { 'terraform', 'terraform-vars' },
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})
