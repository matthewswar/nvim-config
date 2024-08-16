return {
  'm4xshen/hardtime.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
  },
  opts = {
    disable_mouse = false,
    disabled_keys = {
      ['<Up>'] = { 'n' },
      ['<Down>'] = { 'n' },
      ['<Left>'] = { 'n' },
      ['<Right>'] = { 'n' },
    },
  },
}
