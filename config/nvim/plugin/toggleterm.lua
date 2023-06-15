local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then
  return
end

toggleterm.setup({
  open_mapping = [[<C-z>]],
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<C-n>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

-- Map lazygit key only if lazygit is available on the system
if vim.fn.executable('lazygit') == 1 then
  local Terminal  = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new({ direction = "tab", cmd = "lazygit", hidden = true })

  function _lazygit_toggle()
    lazygit:toggle()
  end

  vim.keymap.set('n', '<leader>lg', _lazygit_toggle, { noremap = true, silent = true })
end
