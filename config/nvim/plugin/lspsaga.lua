local ok, saga = pcall(require, 'lspsaga')
if not ok then
  return
end

saga.init_lsp_saga({
  border_style = 'rounded',
  max_preview_lines = 15,
  finder_request_timeout = 4000,
  finder_action_keys = {
    open = "o",
    vsplit = "v",
    split = "n",
  },
})

local diagnostics = require('lspsaga.diagnostic')
vim.keymap.set("n", "<Leader>.", function()
  diagnostics.goto_prev()
end, { silent = true })
vim.keymap.set("n", "<Leader>p", function()
  diagnostics.goto_next()
end, { silent = true })
