local M = {} -- The module to export

function M.vim_material_overrides()
  vim.cmd[[highlight IndentBlanklineContextChar cterm=nocombine ctermfg=170 gui=nocombine guifg=#F76D47]]

  if vim.o.background == 'dark' then
    vim.cmd[[highlight IndentBlanklineChar cterm=nocombine ctermfg=12 gui=nocombine guifg=#344d52]]
  else
    vim.cmd[[highlight IndentBlanklineChar cterm=nocombine ctermfg=12 gui=nocombine guifg=#e4e4e4]]
    vim.cmd[[highlight DiagnosticInfo guifg=#00a27f]]
    vim.cmd[[highlight DiagnosticHint guifg=#fc821d]]
  end
end

function M.everforest()
  vim.cmd[[highlight IndentBlanklineContextChar cterm=nocombine ctermfg=170 gui=nocombine guifg=#F76D47]]

  if vim.o.background == 'light' then
    vim.cmd[[highlight IndentBlanklineChar ctermfg=223 guifg=#e3e5dc]]
  end
end

function M.sonokai()
  vim.cmd[[highlight IndentBlanklineContextChar cterm=nocombine ctermfg=170 gui=nocombine guifg=#F69C5E]]
  vim.cmd[[highlight IndentBlanklineChar cterm=nocombine ctermfg=12 gui=nocombine guifg=#424B5B]]
end

-- List of color overrides.
--   <color-name> = <override fn>
M.overrides = {
  ['vim-material'] = M.vim_material_overrides,
  everforest = M.everforest,
  sonokai = M.sonokai,
}

return M -- Export the module
