local utils = require('utils')

-- Use project's rubocop configs in case the project already has rubocop setup.
working_dir = vim.fn.getcwd()
command = {}

-- binstubbed to 'bin/rubocop'
if utils.is_executable(working_dir .. '/bin/rubocop') then
  command = { 'bin/rubocop', '--lsp' }
-- Found in Gemfile
elseif os.execute("bundle exec rubocop --help >/dev/null 2>&1") then
  command = { 'bundle', 'exec', 'rubocop', '--lsp' }
end

-- Do not initialize rubocop LSP if command not found
if next(command) == nil then
  return
end

local configs = require('configs/lsp')
require('lspconfig').rubocop.setup({
  cmd = command,
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})
