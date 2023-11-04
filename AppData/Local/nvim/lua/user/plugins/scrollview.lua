local status_ok, scrollview = pcall(require, 'scrollview')
if not status_ok then
  vim.notify('Failed to load plugin "dstein64/nvim-scrollview"')
  return
end

scrollview.setup({
  on_startup = true,
  excluded_filetypes = { 'TelescopePrompt', 'NvimTree', 'packer' },
  winblend = 50,
  current_only = true,
  base = 'buffer',
  column = 81,
  auto_workarounds = true,
  hide_on_intersect = true,
})
