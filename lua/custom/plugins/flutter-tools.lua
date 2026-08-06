return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  -- NOTE: the old `lsp.color.enabled` option is deprecated; nvim 0.12's
  -- native vim.lsp.document_color (enabled by default) handles it now.
  opts = {},
}
