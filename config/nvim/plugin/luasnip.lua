local ok, snippets = pcall(require, 'luasnip.loaders.from_vscode')
if not ok then
  return
end

snippets.lazy_load({ paths = { "./snippets" } })
