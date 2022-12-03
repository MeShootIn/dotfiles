-- Import vimrc config.
vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vim/vimrc
]])

-- Import lua modules.
require('user/common')
require('user/plugins/plugins')
require('user/autocommands') -- TODO -> lua
require('user/colorscheme')
require('user/commands')
require('user/keymaps')
require('user/options')
