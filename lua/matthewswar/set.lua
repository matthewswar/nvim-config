vim.opt.wrap = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = '#3b4261' })
