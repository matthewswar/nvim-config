return {
  'windwp/nvim-ts-autotag',
  -- Plugin-wide defaults live under a nested `opts` key (per-filetype
  -- overrides would go in a sibling `per_filetype` table).
  opts = {
    opts = {
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = false,
    },
  },
}