local status_ok, presence = pcall(require, 'presence')
if not status_ok then
  vim.notify('Failed to load plugin "presence"')
  return
end

presence:setup {}
