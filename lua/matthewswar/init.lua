require('matthewswar.set')
require('matthewswar.cmd')
require('matthewswar.remap')

if vim.fn.filereadable(vim.fn.getcwd() .. '/project.godot') == 1 then
  local addr = '/tmp/godot.pipe'
  vim.fn.serverstart(addr)
end
