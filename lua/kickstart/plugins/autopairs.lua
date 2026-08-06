-- autopairs
-- https://github.com/windwp/nvim-autopairs
--
-- NOTE: the old nvim-cmp integration (auto-adding `(` after selecting a
-- function) is now handled natively by blink.cmp's auto_brackets.

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {},
}