return {
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  config = function()
    require('lsp_lines').setup()
    vim.api.nvim_create_autocmd({ 'BufEnter' }, {
      group = 'matthewswar-code',
      callback = function()
        vim.diagnostic.config({
          virtual_text = false,
          virtual_lines = true,
        })
      end,
    })

    vim.api.nvim_create_autocmd({ 'BufEnter' }, {
      group = 'matthewswar-code',
      pattern = { '*.gd' },
      callback = function()
        vim.diagnostic.config({
          virtual_text = true,
          virtual_lines = false,
        })
      end,
    })
  end,
}
