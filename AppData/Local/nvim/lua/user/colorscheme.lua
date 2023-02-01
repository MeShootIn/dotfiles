-- local colorscheme = 'solarized8_high'
-- local colorscheme = 'onedark'
-- local colorscheme = 'tokyonight'
local colorscheme = 'dracula'

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.notify('Colorscheme "' .. colorscheme .. '" not found!')
  return
end

-- SOLARIZED8_HIGH
-- vim.cmd([[
-- set background=dark
-- " set background=light
-- autocmd vimenter * ++nested colorscheme solarized8_high
-- ]])
-- vim.g.solarized_termtrans = 1
-- vim.g.solarized_extra_hi_groups = 1

-- ONEDARK
-- require('onedark').setup {
--   style = 'light',
--   transparent = true,
-- }
-- require('onedark').load()

-- TOKYONIGHT
-- require('tokyonight').setup({
--   style = 'storm',
--   light_style = 'storm',
-- })
