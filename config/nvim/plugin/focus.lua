local ok, focus = pcall(require, 'focus')
if not ok then
  return
end

focus.setup({
  ui = {
    absolutenumber_unfocussed = true,
  },
  hybridnumber = true,
})

-- Disable Focus on some filetypes and buftypes
local augroup = vim.api.nvim_create_augroup('FocusDisable', { clear = true })
local ignore_filetypes = { 'sagafinder', 'sagaoutline', 'NvimTree' }
local ignore_buftypes = {}

vim.api.nvim_create_autocmd('WinEnter', {
    group = augroup,
    callback = function(_)
      if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
        vim.b.focus_disable = true
      end
    end,
    desc = 'Disable focus autoresize for BufType',
})

vim.api.nvim_create_autocmd('FileType', {
    group = augroup,
    callback = function(_)
      if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
        vim.b.focus_disable = true
      end
    end,
    desc = 'Disable focus autoresize for FileType',
})

-- Leader + Up to enlarge focus window
vim.keymap.set('n', '<Leader><Up>', focus.focus_maximise, { noremap = true, silent = true })
vim.keymap.set('n', '<Leader><Down>', focus.focus_autoresize, { noremap = true, silent = true })
