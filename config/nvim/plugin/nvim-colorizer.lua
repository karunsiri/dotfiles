local ok, colorizer = pcall(require, 'colorizer')
if not ok then
  return
end

-- colorizer.setup({
--   filetypes = {
--     '*';
--     '!vim';
--     '!cmp_menu';
--     cmp_docs = { mode = 'background'; }
--   },
--   user_default_options = {
--     css = true,
--     tailwind = true,
--     sass = { enable = true, parsers = { css = true } }
--   },
--   buftypes = {
--     '*',
--   }
-- })

colorizer.setup(
  {
    '*';
    '!vim';
  },
  {
    css = true,
  }
)

-- local utils = require('utils')
--
-- vim.api.nvim_create_autocmd(
--   { 'BufReadPre', 'FileReadPre' },
--   {
--     pattern = 'cmp_docs',
--     callback = function()
--       utils.echo('Attaching colorizer')
--       colorizer.attach_to_buffer(0, { mode = 'background', rgb_fn = true })
--     end,
--   }
-- )
