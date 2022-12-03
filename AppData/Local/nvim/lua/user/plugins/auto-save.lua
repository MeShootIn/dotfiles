-- Usage:
-- `:ASToggle` - toggles auto-save.nvim on and off.

local status_ok, autosave = pcall(require, 'auto-save')
if not status_ok then
  vim.notify('Failed to load plugin "auto-save.nvim"')
  return
end

autosave.setup {
  -- TODO Maybe https://neovim.io/doc/user/api.html#nvim_buf_get_name() ?
  execution_message = {
    message = function()
      -- return 'auto-save.nvim: "' .. vim.fn.expand('%:t') .. '" SAVED successfully'
      return 'auto-save.nvim: SAVED successfully'
    end,
  },
  debounce_delay = 5000,
  callbacks = {
    enabling = function()
      print('auto-save.nvim: turned OFF')
    end,
    disabling = function()
      print('auto-save.nvim: turned ON')
    end
  },
}
