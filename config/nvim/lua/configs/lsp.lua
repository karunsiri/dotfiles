local M = {} -- module to export. Same style as ES6 module.

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<Leader>e', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Enable semantic tokens if the server supports it
  if client.server_capabilities.semanticTokensProvider then
    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
      buffer = bufnr, -- Ensures it only applies to the current buffer
      callback = function()
        vim.lsp.buf.semantic_tokens_full()
      end,
    })
  end

  -- Only map the following keys
  -- after the language server attaches to the current buffer
  --
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<Leader>gd', '<cmd>Lspsaga peek_definition<CR>',bufopts)
  vim.keymap.set('n', '<Leader>go', '<cmd>Lspsaga outline<CR>',bufopts)
  vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Leader>ca', '<cmd>Lspsaga code_action<CR>', bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<Leader>gr', '<cmd>Lspsaga finder<CR>', bufopts)
  vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, bufopts)
end

-- Setup lspconfig.
-- All defaults. No overrides.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Add semantic tokens support
capabilities.textDocument.semanticTokens = {
  full = true,
  requests = { range = true },
}

M.on_attach = on_attach
M.capabilities = capabilities
return M
