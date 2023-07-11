local ok, rose = pcall(require, 'rose-pine')
if not ok then
  return
end

rose.setup({
  dark_variant = 'moon',
  highlight_groups = {
		IndentBlanklineChar = { fg = 'highlight_med' },
    IndentBlanklineContextChar = { fg = 'rose' },

    -- TSX
    ['@variable.tsx'] = { link = null },
    ['@constructor.tsx'] = { fg = 'rose', italic = false },
    ['@include.tsx'] = { fg = 'love' },
    ['@keyword.tsx'] = { fg = 'love' },
    ['@type.tsx'] = { fg = 'text', italic = false },
    ['@tag.attribute.tsx'] = { fg = 'foam' },

    -- Ruby
    ['@variable.ruby'] = { link = null },
    ['@symbol.ruby'] = { fg = 'gold' },
    ['@punctuation.bracket.ruby'] = { fg = 'iris' },
    ['@keyword.ruby'] = { fg = 'love' },
    ['@keyword.function.ruby'] = { fg = 'love' },

    -- Terraform
    ['@variable.terraform'] = { link = null },
    ['@lsp.type.type.terraform'] = { fg = 'love' },
	}
})
