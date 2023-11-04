local status_ok, _ = pcall(require, 'textcase')
if not status_ok then
  vim.notify('Failed to load plugin "johmsalas/text-case.nvim"')
  return
end

-- TODO https://github.com/johmsalas/text-case.nvim/wiki
-- require('textcase').setup {}
