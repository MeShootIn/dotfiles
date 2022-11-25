-- Import vimrc config.
vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vim/vimrc
]])

-- Import lua modules.
require('user/plugins/plugins')
require('user/colorscheme')
require('user/autocommands') -- TODO -> lua
require('user/commands')
require('user/keymaps')
require('user/options')
