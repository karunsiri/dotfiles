local configs = require('configs/lsp')

if true then
  return
end

require('lspconfig').tailwindcss.setup({
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})
