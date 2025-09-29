local configs = require('configs/lsp')

vim.lsp.config('ts_ls', {
  on_attach = configs.on_attach,
  flags = configs.lsp_flags,
})

vim.lsp.enable('ts_ls')
