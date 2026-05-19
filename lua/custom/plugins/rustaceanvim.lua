return {
  'mrcjkb/rustaceanvim',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  version = '^6',
  lazy = false,
  config = function()
    vim.lsp.enable('rust_analyzer', false)
  end,
}
