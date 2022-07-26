local configs = require('configs/lsp')

require('lspconfig').tsserver.setup{
  on_attach = configs.on_attach,
  flags = configs.lsp_flags,
}
