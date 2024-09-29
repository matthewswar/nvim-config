return {
  'andythigpen/nvim-coverage',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    auto_reload = true,
    -- load_coverage_cb = function(ftype)
    --   vim.notify('Loaded ' .. ftype .. ' coverage')
    -- end,
  },
}
