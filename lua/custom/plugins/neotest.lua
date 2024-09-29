return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'fredrikaverpil/neotest-golang',
    'nvim-neotest/neotest-jest',
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-golang')({
          go_test_args = { '-coverprofile=' .. vim.fn.getcwd() .. '/coverage.out' },
        }),
        require('neotest-jest')({}),
      },
      discovery = {
        enabled = false,
      },
    })

    vim.api.nvim_create_autocmd('BufWritePost', {
      group = vim.api.nvim_create_augroup('golang', {}),
      pattern = '*.go',
      callback = function()
        require('coverage').load()
      end,
    })
  end,
  keys = {
    {
      '<leader>ctf',
      function()
        local current_file_name = vim.api.nvim_buf_get_name(0)
        local file_extension = '.go'
        local file_suffix = '_test'
        local test_file_suffix = file_suffix .. file_extension
        local is_go_file = current_file_name:sub(-#file_extension) == file_extension
        local is_go_test_file = current_file_name:sub(-#test_file_suffix) == test_file_suffix
        if not is_go_file or is_go_test_file then
          require('neotest').run.run(vim.fn.expand('%'))
          return
        end

        -- Non-test go file
        local test_file_name = vim.fn.expand('%'):sub(0, -#file_extension - 1) .. '_test.go'
        if vim.fn.filereadable(test_file_name) then
          require('neotest').run.run(test_file_name)
        end
      end,
      desc = 'run [f]ile',
    },
    {
      '<leader>ctp',
      function()
        require('neotest').run.run(vim.fn.expand('%:h'))
      end,
      desc = 'run [p]ackage',
    },
    {
      '<leader>ctA',
      function()
        require('neotest').run.run(vim.uv.cwd())
      end,
      desc = 'run [A]ll files',
    },
    {
      '<leader>ctS',
      function()
        require('neotest').run.run({ suite = true })
      end,
      desc = 'run [S]uite',
    },
    {
      '<leader>ctt',
      function()
        require('neotest').run.stop()
      end,
      desc = '[t]erminate',
    },
    {
      '<leader>ctn',
      function()
        local neotest = require('neotest')
        neotest.output_panel.clear()
        neotest.run.run()
      end,
      desc = '[n]earest test',
    },
    {
      '<leader>cto',
      function()
        require('neotest').output_panel.toggle()
      end,
      desc = 'toggle [o]utput',
    },
    {
      '<leader>ctc',
      function()
        require('coverage').toggle()
      end,
      desc = 'toggle [c]overage',
    },
  },
}
