vim.g.go_fmt_command = 'goimports'

vim.o.listchars = 'tab:  ,trail:·,nbsp:·'
vim.bo.expandtab = false
vim.cmd[[compiler go]]

vim.api.nvim_create_autocmd(
  { 'BufWritePre' },
  { buffer = 0, callback = vim.lsp.buf.formatting_sync }
)
