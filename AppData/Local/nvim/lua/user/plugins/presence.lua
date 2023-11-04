local status_ok, presence = pcall(require, 'presence')
if not status_ok then
  vim.notify('Failed to load plugin "andweeb/presence.nvim"')
  return
end

presence:setup {}
