local configs = require('configs/lsp')

require('lspconfig').terraformls.setup({
  cmd = { 'terraform-ls', 'serve' },
  filetypes = { 'terraform' },
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})

require('luasnip.loaders.from_vscode').lazy_load({ paths = { "../../snippets" } })
