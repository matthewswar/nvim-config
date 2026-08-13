return {
  'christoomey/vim-tmux-navigator',
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateRight',
    'TmuxNavigateUp',
    'TmuxNavigatePrevious',
  },
  keys = {
    { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
    { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
    { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
    { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
    { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
  },
}