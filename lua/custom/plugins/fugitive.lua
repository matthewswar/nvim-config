local function run_cmd(command)
  local handle = io.popen(command)
  if handle == nil then
    return nil
  end
  local output = handle:read('*a')
  handle:close()
  return vim.fn.trim(output)
end

local function retrieve_blame_hash()
  local current_line = tostring(vim.fn.getpos('.')[2])
  local current_file_path_full = vim.fn.expand('%')

  local output = run_cmd('git blame -L ' .. current_line .. ',' .. current_line .. ' "' .. current_file_path_full .. '"')
  return vim.fn.matchstr(output, '^\\S\\+')
end

return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[g]it [s]ource' })
    vim.keymap.set('n', '<leader>gds', '<Cmd>Gvdiffsplit<CR>', { desc = '[g]it [d]iff [s]plit' })
    vim.keymap.set('n', '<leader>gb', '<Cmd>GBrowse<CR>', { desc = '[g]it [b]rowse' })
    vim.keymap.set('v', '<leader>gb', function()
      local start_pos = vim.fn.getpos('v')[2]
      local end_pos = vim.fn.getpos('.')[2]
      if start_pos > end_pos then
        start_pos, end_pos = end_pos, start_pos
      end
      vim.cmd(tostring(start_pos) .. ',' .. tostring(end_pos) .. 'GBrowse')
    end, { desc = '[g]it [b]rowse' })
    vim.keymap.set('n', '<leader>gc', function()
      local blame_hash = retrieve_blame_hash()
      vim.cmd('GBrowse ' .. blame_hash)
    end, { desc = '[g]it open [c]ommit' })
    vim.keymap.set('n', '<leader>gp', function()
      local blame_hash = retrieve_blame_hash()
      local output = run_cmd('git log -n 1 --no-decorate --oneline ' .. blame_hash)

      local pull_request_number = vim.fn.matchstr(output, [[\v\(#\zs\d+\ze\)$]])
      if pull_request_number == '' then
        print('Pull request number not found')
        return
      end

      output = run_cmd('git ls-remote --get-url origin')
      local domain = vim.fn.matchstr(output, [[\vgit\@\zs.*\ze:]])
      local repo = vim.fn.matchstr(output, [[\vgit\@.*:\zs.*\ze.git]])

      vim.cmd('GBrowse https://' .. domain .. '/' .. repo .. '/pull/' .. pull_request_number)
    end, { desc = '[g]it open [p]ull request' })
  end,
}
