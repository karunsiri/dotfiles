local ok, hop = pcall(require, 'hop')
if not ok then
  return
end

hop.setup()

local opts = { noremap = true }
vim.keymap.set('n', '<Leader><Leader>s', function() hop.hint_char1() end, opts)
vim.keymap.set('n', '<Leader><Leader>w', function() hop.hint_words() end, opts)
