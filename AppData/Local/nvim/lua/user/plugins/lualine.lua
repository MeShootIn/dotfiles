-- TODO https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#component-options
local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  vim.notify('Failed to load plugin "nvim-lualine/lualine.nvim"')
  return
end

local function session_status()
  local status = vim.api.nvim_call_function('ObsessionStatus', {'.session.vim', '!!!!!!!!!! SESSION PAUSED OR DELETED !!!!!!!!!!'})

  if status == '' then
    return '!!!!! NO SESSION !!!!!'
  end

  return status
end

-- FIXME
local function session_status_color()
  local WORKING = 'WORKING'
  local PAUSED_OR_DELETED = 'PAUSED_OR_DELETED'
  local NO_SESSION = ''
  local status = vim.api.nvim_call_function('ObsessionStatus', { WORKING, PAUSED_OR_DELETED })

  if status == WORKING then
    return { bg = 'red' }
  elseif status == PAUSED_OR_DELETED then
    return { bg = 'yellow' }
  elseif status == NO_SESSION then
    return { bg = 'grey' }
  end
end

lualine.setup {
  options = {
    -- theme = 'solarized_dark',
    -- theme = 'solarized_light',
    -- theme = 'onedark',
    -- theme = 'onelight',
    -- theme = 'tokyonight',
    -- theme = 'dracula',
    -- theme = 'gruvbox_dark',
    -- theme = 'gruvbox_light',
    -- theme = 'gruvbox',
    theme = 'gruvbox-material',
    icons_enabled = true,
    disabled_filetypes = { 'alpha', 'TelescopePrompt', 'NvimTree', 'packer' },
  },
  sections = {
    lualine_a = { 'mode' },
    -- lualine_b = { 'filename', 'diagnostics' },
    lualine_b = { 'filename' },
    lualine_c = { 'branch' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = {},
    lualine_z = {
      {
        session_status,
        -- color = session_status_color
      },
    }
  },
}
