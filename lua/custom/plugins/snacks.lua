return {
  'folke/snacks.nvim',
  opts = {
    terminal = {
      win = {
        keys = {
          nav_h = { '<C-h>', '<cmd><C-U>TmuxNavigatorLeft<cr>', desc = 'Navigate Left', mode = 't' },
          nav_j = { '<C-j>', '<cmd><C-U>TmuxNavigatorDown<cr>', desc = 'Navigate Down', mode = 't' },
          nav_k = { '<C-k>', '<cmd><C-U>TmuxNavigatorUp<cr>', desc = 'Navigate Up', mode = 't' },
          nav_l = { '<C-l>', '<cmd><C-U>TmuxNavigatorRight<cr>', desc = 'Navigate Right', mode = 't' },
          term_normal = { '<C-\\>', '<C-\\><C-n>', desc = 'Exit Terminal mode', mode = 't' },
        },
      },
    },
  },
}
