vim.opt.wrap = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.spell = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = '#3b4261' })

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.opt.foldlevelstart = 99
