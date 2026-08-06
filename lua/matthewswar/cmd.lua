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

vim.api.nvim_create_autocmd('BufEnter', {
  group = matthewswarGroup,
  pattern = { '*.js.tpl', '*.js.tmpl' },
  callback = function()
    vim.opt_local.filetype = 'javascript'
  end,
})

-- Diagnostics as virtual lines (native since nvim 0.11; previously via the
-- lsp_lines.nvim plugin), except gdscript which reads better with virtual
-- text. vim.diagnostic.config is global, so flip it on buffer entry.
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
})

vim.api.nvim_create_autocmd('BufEnter', {
  group = matthewswarGroup,
  callback = function()
    local is_gdscript = vim.bo.filetype == 'gdscript'
    vim.diagnostic.config({
      virtual_text = is_gdscript,
      virtual_lines = not is_gdscript,
    })
  end,
})
