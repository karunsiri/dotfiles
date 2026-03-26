local utils = require('utils')
local configs = require('configs/lsp')

local working_dir = vim.fn.getcwd()
local command = {}

if utils.is_executable(working_dir .. '/.node_modules/.bin/astro') then
  command = { 'npx', 'astro-ls', '--stdio' }
elseif os.execute("astro-ls >/dev/null 2>&1") then
  command = { 'astro-ls', '--stdio' }
end

vim.lsp.config('astro', {
  cmd = command,
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
})
vim.lsp.enable('astro')
