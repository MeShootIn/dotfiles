-- NOTE ONLY Neovim specific options
--
-- https://github.com/LunarVim/Neovim-from-scratch/blob/03-plugins/lua/user/options.lua
local options = {}

vim.opt.shortmess:append 'c'

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- For improved navigation through '.lua' files
vim.opt_local.suffixesadd:prepend('.lua')
vim.opt_local.suffixesadd:prepend('init.lua')
vim.opt_local.path:prepend(vim.fn.stdpath('config') .. '/lua')

-- Disable netrw in favor of "vim-dirvish".
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Netrw file explorer settings.
vim.cmd([[
" let g:netrw_banner = 0 " Hide banner above files.
let g:netrw_browse_split = 3 " Vertical split window when <CR> pressed on file.
let g:netrw_liststyle = 3 " Tree instead of plain view.
let g:netrw_list_hide = netrw_gitignore#Hide() " Hide anything ignored by Git.
]])
