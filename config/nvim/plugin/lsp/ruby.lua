local configs = require('configs/lsp')

require('lspconfig').solargraph.setup({
  cmd = { "./solargraph", "stdio" },
  settings = {
    solargraph = {
      diagnostics = true,
      completion = true,
    }
  },
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})
