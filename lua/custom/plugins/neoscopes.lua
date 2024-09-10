return {
  'smartpde/neoscopes',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function(_, opts)
    require('neoscopes').setup(opts)

    vim.keymap.set('n', '<leader>sSg', function()
      require('telescope.builtin').live_grep({
        search_dirs = require('neoscopes').get_current_dirs(),
      })
    end, { desc = '[s]earch [S]coped live grep' })
    vim.keymap.set('n', '<leader>sSf', function()
      require('telescope.builtin').find_files({
        search_dirs = require('neoscopes').get_current_dirs(),
      })
    end, { desc = '[s]earch [S]coped find files' })
  end,
}
