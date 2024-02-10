-- local colorscheme = 'solarized8_high'
-- local colorscheme = 'onedark'
local colorscheme = 'tokyonight'
-- local colorscheme = 'dracula'
-- local colorscheme = 'gruvbox-material'

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.notify('Colorscheme "' .. colorscheme .. '" not found!')
  return
end

-- GENERAL
vim.cmd([[
set background=dark
" set background=light
]])

-- SOLARIZED8_HIGH
-- vim.cmd([[
-- autocmd vimenter * ++nested colorscheme solarized8_high
-- ]])
-- vim.g.solarized_termtrans = 1
-- vim.g.solarized_extra_hi_groups = 1

-- ONEDARK
-- require('onedark').setup {
--   style = 'light',
--   -- style = 'deep',
--   transparent = true,
-- }
-- require('onedark').load()

-- TOKYONIGHT
require('tokyonight').setup({
  style = 'storm',
  light_style = 'storm',
})

-- DRACULA
-- vim.cmd([[
-- colorscheme dracula
-- ]])

-- GRUVBOX
-- vim.cmd([[
-- colorscheme gruvbox-material
-- ]])
-- vim.g.gruvbox_material_foreground = 'original'
-- vim.g.gruvbox_material_background = 'hard'
-- vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_ui_contrast = 'high'
