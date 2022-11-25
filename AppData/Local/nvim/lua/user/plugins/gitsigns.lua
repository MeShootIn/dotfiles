-- TODO https://github.com/lewis6991/gitsigns.nvim
-- TODO Integration with vim-fugitive
-- https://www.youtube.com/watch?v=ub0REXjhpmk

local status_ok, gitsigns = pcall(require, 'gitsigns')
if not status_ok then
  vim.notify('Failed to load plugin "gitsigns"')
  return
end

gitsigns.setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '+' },
    change = { hl = 'GitGutterChange', text = '~' },
    delete = { hl = 'GitGutterDelete', text = '_' },
    topdelete = { hl = 'GitGutterDelete', text = '‾' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
  },
}
