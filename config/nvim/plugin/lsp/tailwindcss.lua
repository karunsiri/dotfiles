local configs = require('configs/lsp')

if true then
  return
end

vim.lsp.config('tailwindcss', {
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})

vim.lsp.enable('tailwindcss')
