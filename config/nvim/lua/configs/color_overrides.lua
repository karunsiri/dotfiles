-- Overrides highlight colors upon switching color schemes.
-- For example, some color schemes have too strong indent line color which is so
-- distracting when coding.
local api = vim.api
local group_id = api.nvim_create_augroup('ColorOverride', { clear = true })
local overrides = require('configs/highlights').overrides

for color, fn in pairs(overrides) do
  api.nvim_create_autocmd(
    { 'ColorScheme' }, { group = group_id, pattern = color, callback = fn }
  )
end
