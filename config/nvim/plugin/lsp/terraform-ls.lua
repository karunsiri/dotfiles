local configs = require('configs/lsp')

vim.lsp.config('terraformls', {
  filetypes = { 'terraform', 'terraform-vars' },
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})

vim.lsp.enable('terraformls')
