vim.g.copilot_no_tab_map = true
-- local Copilot state
vim.g._copilot_enabled = true

-- Toggle the Copilot plugin on or off
function ToggleCopilot()
  if vim.g._copilot_enabled then
    vim.g._copilot_enabled = false
    vim.cmd[[Copilot disable]]
  else
    vim.g._copilot_enabled = true
    vim.cmd[[Copilot enable]]
  end
end

-- Keymap to toggle Copilot
vim.keymap.set('n', '<leader>co', ToggleCopilot, { desc = 'Toggle Copilot' })

-- Ctrl+L to accept Copilot suggestion
vim.keymap.set('i', '<C-L>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
