local api = vim.api
local group_id = api.nvim_create_augroup('ColorOverride', { clear = true })

local vim_material_overrides = function()
  vim.cmd[[highlight IndentBlanklineContextChar cterm=nocombine ctermfg=170 gui=nocombine guifg=#F76D47]]

  if vim.o.background == 'dark' then
    vim.cmd[[highlight IndentBlanklineChar cterm=nocombine ctermfg=12 gui=nocombine guifg=#344d52]]
  else
    vim.cmd[[highlight IndentBlanklineChar cterm=nocombine ctermfg=12 gui=nocombine guifg=#e4e4e4]]
  end
end

api.nvim_create_autocmd(
  { 'ColorScheme' },
  {
    group = group_id,
    pattern = 'vim-material',
    callback = vim_material_overrides,
  }
)
