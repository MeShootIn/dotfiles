-- Usage:
-- `:ASToggle` - toggles auto-save.nvim on and off.

-- asds
-- asd

local status_ok, autosave = pcall(require, 'auto-save')
if not status_ok then
  vim.notify('Failed to load plugin "pocco81/auto-save.nvim"')
  return
end

autosave.setup {
  execution_message = {
    message = function()
      return ''
    end,
  },
  debounce_delay = 5000,
  callbacks = {
    enabling = function()
      print('pocco81/auto-save.nvim: turned OFF')
    end,
    disabling = function()
      print('pocco81/auto-save.nvim: turned ON')
    end,
  },
}
