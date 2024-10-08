local matthewswarGroup = vim.api.nvim_create_augroup('Matthewswar', {})

-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
--   group = matthewswarGroup,
--   pattern = '*.rs,*.lua',
--   callback = function()
--     vim.opt.colorcolumn = '80'
--     vim.cmd('hi ColorColumn ctermbg=0 guibg=#333333')
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ 'BufLeave', 'BufWinLeave' }, {
--   group = matthewswarGroup,
--   callback = function()
--     vim.opt.colorcolumn = ''
--   end,
-- })

vim.api.nvim_create_autocmd('LspAttach', {
  group = matthewswarGroup,
  callback = function(args)
    if vim.lsp.inlay_hint then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})
