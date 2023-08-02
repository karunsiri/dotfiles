local ok, hop = pcall(require, 'hop')
if not ok then
  return
end

hop.setup()

local opts = { noremap = true }
vim.keymap.set({ 'n', 'v' }, 'f', hop.hint_char1, opts)
vim.keymap.set({ 'n', 'v' }, 'F', hop.hint_words, opts)
