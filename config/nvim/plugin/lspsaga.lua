local ok, saga = pcall(require, 'lspsaga')
if not ok then
  return
end

saga.setup({
  request_timeout = 4000,
  symbol_in_winbar = {
    enable = true,
  },
  ui = {
    theme = 'round',
    border = 'rounded',
    winblend = 0,
  },
  preview = {
    lines_above = 5,
    lines_below = 15
  },
  scroll_preview = {
    scroll_down = '<C-j>',
    scroll_up = '<C-k>',
  },
  finder = {
    vsplit = "v",
    split = "n",
    vsplit = "v",
    tabe = "t",
  },
})

local diagnostics = require('lspsaga.diagnostic')
vim.keymap.set("n", "<Leader>.", function()
  diagnostics:goto_prev()
end, { silent = true })
vim.keymap.set("n", "<Leader>p", function()
  diagnostics:goto_next()
end, { silent = true })
