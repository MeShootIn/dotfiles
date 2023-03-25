vim.cmd([[
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
]])

vim.cmd([[
au TextYankPost * silent! lua vim.highlight.on_yank { timeout=3000, on_macro=true }
]])

-- Automatically enter Insert mode when terminal is opened.
vim.cmd([[
autocmd TermOpen * startinsert
]])

-- `.prettierignore` uses gitignore syntax.
vim.cmd([[
autocmd BufNewFile,BufRead .prettierignore setlocal filetype=gitignore
]])
