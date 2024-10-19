local status_ok, oil = pcall(require, 'oil')
if not status_ok then
  vim.notify('Failed to load plugin "stevearc/oil.nvim"')
  return
end


oil.setup()
