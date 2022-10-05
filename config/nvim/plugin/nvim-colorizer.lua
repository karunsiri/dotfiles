local ok, colorizer = pcall(require, 'colorizer')
if not ok then
  return
end

colorizer.setup(
  {
    '*';
    '!vim';
  },
  { rgb_fn = true }
)
