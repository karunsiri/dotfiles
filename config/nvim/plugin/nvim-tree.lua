require("nvim-tree").setup({
  -- Prefer startup root directory when updating root directory of the tree.
  -- Only relevant when `update_focused_file.update_root` is `true`
  prefer_startup_root = true,
  update_focused_file = {
    update_root = true,
  },
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
    },
  }
})
