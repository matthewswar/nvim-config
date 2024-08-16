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
    { '<c-j>', '<cmd><C-U>TmuxNavigatorLeft<cr>' },
    { '<c-l>', '<cmd><C-U>TmuxNavigatorLeft<cr>' },
    { '<c-k>', '<cmd><C-U>TmuxNavigatorLeft<cr>' },
    { '<c-\\>', '<cmd><C-U>TmuxNavigatorLeft<cr>' },
  },
}
