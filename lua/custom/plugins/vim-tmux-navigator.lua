return {
  'christoomey/vim-tmux-navigator',
  cmd = {
    'TmuxNavigatorLeft',
    'TmuxNavigatorDown',
    'TmuxNavigatorRight',
    'TmuxNavigatorUp',
    'TmuxNavigatorPrevious',
  },
  keys = {
    { '<c-h>', '<cmd><C-U>TmuxNavigatorLeft<cr>' },
    { '<c-j>', '<cmd><C-U>TmuxNavigatorDown<cr>' },
    { '<c-l>', '<cmd><C-U>TmuxNavigatorRight<cr>' },
    { '<c-k>', '<cmd><C-U>TmuxNavigatorUp<cr>' },
    { '<c-\\>', '<cmd><C-U>TmuxNavigatorPrevious<cr>' },
  },
}
