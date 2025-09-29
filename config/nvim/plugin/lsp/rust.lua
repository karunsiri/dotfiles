local configs = require('configs/lsp')

vim.lsp.config('rust_analyzer', {
    on_attach = configs.on_attach,
    capabilities = configs.capabilities,

    -- Server-specific settings
    settings = {
      ["rust-analyzer"] = {}
    }
})

vim.lsp.enable('rust_analyzer')
