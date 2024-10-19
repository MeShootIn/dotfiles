local status_ok, netrw = pcall(require, 'netrw')
if not status_ok then
  vim.notify('Failed to load plugin "prichrd/netrw.nvim"')
  return
end

require('netrw').setup({
  use_devicons = true,
})
