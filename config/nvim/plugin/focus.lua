local ok, focus = pcall(require, 'focus')
if not ok then
  return
end

focus.setup({
  absolutenumber_unfocussed = true,
  hybridnumber = true,
})

-- Leader + Up to enlarge focus window
vim.keymap.set('n', '<Leader><Up>', focus.focus_maximise, { noremap = true, silent = true })
