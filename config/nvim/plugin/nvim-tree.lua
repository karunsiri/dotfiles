require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key='x', action="" },
        { key='<C-x>', action="" },
      },
    },
  },
  filters = {
    custom = { "^.git$" },
  },
})
