-- TODO https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#component-options
local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  vim.notify('Failed to load plugin "nvim-lualine/lualine.nvim"')
  return
end

function session_status()
  local status = vim.api.nvim_call_function('ObsessionStatus', {'.session.vim', 'SESSION PAUSED OR DELETED!!!'})

  if status == '' then
    return 'NO SESSION!'
  end

  return status
end

lualine.setup {
  options = {
    -- theme = 'solarized_dark',
    -- theme = 'solarized_light',
    theme = 'onedark',
    -- theme = 'tokyonight',
    -- theme = 'dracula',
    -- theme = 'gruvbox_dark',
    -- theme = 'gruvbox_light',
    -- theme = 'gruvbox',
    -- theme = 'gruvbox-material',
    disabled_filetypes = { 'alpha', 'TelescopePrompt', 'NvimTree', 'packer' },
  },
  sections = {
    lualine_a = { 'mode' },
    -- lualine_b = { 'filename', 'diagnostics' },
    lualine_b = { 'filename' },
    lualine_c = { 'branch' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = {},
    lualine_z = { session_status }
  },
}
