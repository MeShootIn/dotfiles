local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  vim.notify('Failed to load plugin "nvim-lualine/lualine.nvim"')
  return
end

local UTC_DIFF = 5

local function HMS()
  return os.date('!%H:%M:%S', os.time() + UTC_DIFF * 60 * 60)
end

local function moonPhase()
  local SECS_IN_A_DAY = 24 * 60 * 60

  local pattern = '(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)'
  local hms = HMS()
  local dateToConvert = '1970-01-02 ' .. hms -- HACK for correct calculations
  local year, month, day, hour, min, sec = dateToConvert:match(pattern)
  local dailyTS = os.time({
    year = year,
    month = month,
    day = day,
    hour = hour,
    min = min,
    sec = sec,
  })
  dailyTS = dailyTS + (-24 + UTC_DIFF) * 60 * 60 -- HACK subtract back one day

  --                            🌓                      🌗
  local phases = { '🌚', '🌒', '🌛', '🌔', '🌝', '🌖', '🌜', '🌘' }
  local phaseIndex = math.floor(dailyTS / (SECS_IN_A_DAY / #phases)) + 1

  return phases[phaseIndex]
end

lualine.setup {
  options = {
    -- theme = 'solarized_dark',
    -- theme = 'solarized_light',
    -- theme = 'onedark',
    -- theme = 'tokyonight',
    -- theme = 'dracula',
    theme = 'gruvbox_dark',
    -- theme = 'gruvbox_light',
    -- theme = 'gruvbox',
    -- theme = 'gruvbox-material',
    disabled_filetypes = { 'alpha', 'TelescopePrompt', 'NvimTree', 'packer' },
  },
  sections = {
    lualine_y = { HMS },
    lualine_z = { moonPhase },
  },
}

-- Trigger rerender of status line every second for clock.
if _G.Statusline_timer == nil then
  _G.Statusline_timer = vim.loop.new_timer()
else
  _G.Statusline_timer:stop()
end

_G.Statusline_timer:start(
  0,
  1000,
  vim.schedule_wrap(function() vim.api.nvim_command('redrawstatus') end)
)
