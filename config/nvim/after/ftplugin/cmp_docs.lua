local ok, colorizer = pcall(require, 'colorizer')
if not ok then
  return
end

-- colorizer.attach_to_buffer(0, { mode = 'background', rgb_fn = true })
-- vim.cmd[[ColorizerAttachToBuffer]]
if not colorizer.is_buffer_attached(0) then
  -- local current_buff = vim.api.nvim_get_current_buf()
  -- colorizer.attach_to_buffer(0, { mode = 'background', css = true })
  -- colorizer.buffer.rehighlight(current_buff, { mode = 'background', css = true }, {})
end

-- print(vim.inspect(vim.bo.buftype))
-- print(vim.inspect(vim.bo.filetype))
-- require("nvim-highlight-colors").turnOn()
-- vim.cmd[[]]
-- colorizer.attach_to_buffer(0, { mode = 'background', css = true })
-- print(vim.inspect(vim.api.nvim_get_current_buf()))
-- ns = vim.api.nvim_create_namespace(vim.bo.filetype)
-- vim.cmd[[echo bufnr('%')]]
-- vim.cmd[[setl ft]]
-- vim.cmd('colorscheme everforest')
-- vim.b[0].background = 'light'
