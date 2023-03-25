local status_ok, <++> = pcall(require, '<++>')
if not status_ok then
  vim.notify('Failed to load plugin "<++>"')
  return
end
