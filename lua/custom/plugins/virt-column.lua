return {
  'lukas-reineke/virt-column.nvim',
  config = function()
    require('virt-column').setup({
      virtcolumn = '80',
    })

    vim.cmd('hi NonText guifg=#26262E')
  end,
}
