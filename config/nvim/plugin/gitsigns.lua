local function map(mode, lhs, rhs, opts)
  opts = vim.tbl_extend(
    'force', {
      noremap = true,
      silent = true,
      buffer = bufnr,
    },
    opts or {}
  )
  -- vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
  return
end

gitsigns.setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    map('n', '<Leader>db', function() gs.blame_line() end)
    map('n', '<Leader>dd', function() gs.diffthis() end)

    -- Hunk actions
    map('n', '<Leader>dp', function() gs.preview_hunk() end)
    map('n', '<Leader>ds', function() gs.stage_hunk() end)
    map('n', '<Leader>ds', gs.stage_hunk)
    map('n', '<Leader>du', function() gs.undo_stage_hunk() end)
  end
})
