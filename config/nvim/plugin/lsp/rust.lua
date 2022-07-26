local configs = require('configs/lsp')

require('lspconfig').rust_analyzer.setup{
    on_attach = configs.on_attach,
    capabilities = configs.capabilities,

    -- Server-specific settings
    settings = {
      ["rust-analyzer"] = {}
    }
}
