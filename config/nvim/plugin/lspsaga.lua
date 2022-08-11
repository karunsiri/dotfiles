local ok, saga = pcall(require, 'lspsaga')
if not ok then
  return
end

saga.init_lsp_saga({
  border_style = 'rounded',
  -- diagnostic_header = { "", "", "", "ﴞ" },
  diagnostic_header = { "❌", "", "", "ﴞ" },
})

local diagnostics = require('lspsaga.diagnostic')
vim.keymap.set("n", "<Leader>.", function()
  diagnostics.goto_prev()
end, { silent = true })
vim.keymap.set("n", "<Leader>p", function()
  diagnostics.goto_next()
end, { silent = true })
