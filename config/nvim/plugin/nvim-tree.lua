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
  actions = {
    change_dir = {
      enable = true,
      global = true,
      restrict_above_cwd = false,
    },
  }
})
