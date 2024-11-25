-- Usage:
-- `:ASToggle` - toggles between on and off.

local status_ok, autosave = pcall(require, 'auto-save')
if not status_ok then
  vim.notify('Failed to load plugin "pocco81/auto-save.nvim"')
  return
end

autosave.setup {
  enabled = true,
  execution_message = {
    message = function()
      return ''
    end,
  },
  condition = function(buf)
    -- NOTE Full regex: [[\m\C^\(dav\|fetch\|ftp\|http\|rcp\|rsync\|scp\|sftp\|file\)://]]
    if vim.regex([[\m\C^\(scp\)://]]):match_str(vim.fn.expand('%:p')) ~= nil then
      return false
    end

    return true
  end,
  write_all_buffers = false,
  debounce_delay = 3000,
  callbacks = {
    enabling = function()
      vim.print('pocco81/auto-save.nvim: turned OFF')
    end,
    disabling = function()
      vim.print('pocco81/auto-save.nvim: turned ON')
    end,
  },
}
