local configs = require('configs/lsp')

require('lspconfig').ts_ls.setup{
  on_attach = configs.on_attach,
  flags = configs.lsp_flags,
}
