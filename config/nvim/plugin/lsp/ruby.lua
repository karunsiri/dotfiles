local configs = require('configs/lsp')

vim.lsp.config('solargraph', {
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

vim.lsp.enable('solargraph')
