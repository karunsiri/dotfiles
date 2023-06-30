local ok, rose = pcall(require, 'rose-pine')
if not ok then
  return
end

rose.setup({
  dark_variant = 'moon',
  highlight_groups = {
		IndentBlanklineChar = { fg = 'highlight_med' },
    IndentBlanklineContextChar = { fg = 'rose' },
	}
})
