-- NOTE: snacks.win key specs treat a string rhs as the NAME of a snacks
-- window action (falling back to a silent no-op), NOT as keys to feed.
-- Anything that should run a command or feed keys must be a Lua callback.
local function tmux_navigate(direction)
  return function()
    vim.cmd('TmuxNavigate' .. direction)
  end
end

return {
  'folke/snacks.nvim',
  opts = {
    terminal = {
      win = {
        keys = {
          nav_h = { '<C-h>', tmux_navigate('Left'), desc = 'Navigate Left', mode = 't' },
          nav_j = { '<C-j>', tmux_navigate('Down'), desc = 'Navigate Down', mode = 't' },
          nav_k = { '<C-k>', tmux_navigate('Up'), desc = 'Navigate Up', mode = 't' },
          nav_l = { '<C-l>', tmux_navigate('Right'), desc = 'Navigate Right', mode = 't' },
          term_normal = {
            '<C-\\>',
            function()
              -- stopinsert is a no-op in terminal mode; feed the built-in
              -- <C-\><C-n> unmapped instead.
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, false, true), 'n', false)
            end,
            desc = 'Exit Terminal mode',
            mode = 't',
          },
        },
      },
    },
  },
}