local ok, focus = pcall(require, 'focus')
if not ok then
  return
end

focus.setup()

maximize = focus.focus_maximise

-- Leader + Up to enlarge focus window
vim.keymap.set('n', '<Leader><Up>', maximize, { noremap = true, silent = true })
