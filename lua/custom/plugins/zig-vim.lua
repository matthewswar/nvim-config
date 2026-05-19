return {
  'ziglang/zig.vim',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  config = function()
    vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
      group = 'matthewswar-code',
      pattern = { '*.zig', '*.zon' },
      callback = function()
        vim.lsp.buf.format()
      end,
    })
    -- vim.api.nvim_create_autocmd('BufWritePre', {
    --   group = 'matthewswar-code',
    --   pattern = { '*.zig', '*.zon' },
    --   callback = function()
    --     vim.lsp.buf.code_action({
    --       context = {
    --         only = { 'source.organizeImports' },
    --         diagnostics = {},
    --       },
    --       apply = true,
    --     })
    --   end,
    -- })

    vim.lsp.config('zls', {
      cmd = { '/home/matthewswar/Brograms/zig/zls/zig-out/bin/zls' },
    })
    vim.lsp.enable('zls')
  end,
}
