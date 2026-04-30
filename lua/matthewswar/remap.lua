-- vim.keymap.set('n', '<leader>l', '<cmd>ToggleNeoColumn<cr>', { noremap = true, desc = '[H] Toggle NeoColumn' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show [e]rror message' })
vim.keymap.set('n', '<leader>Q', ':bp|sp|bn|bd<CR>', { desc = '[Q]uit Buffer' })

-- vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
-- vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })

vim.keymap.set('n', '<C-u>', [[<Cmd>lua vim.cmd('normal! <C-u>'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]])
vim.keymap.set('n', '<C-d>', [[<Cmd>lua vim.cmd('normal! <C-d>'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]])

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
