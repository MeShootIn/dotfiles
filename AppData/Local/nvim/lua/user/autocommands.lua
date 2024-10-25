vim.cmd([[
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
]])

vim.cmd([[
autocmd TextYankPost * silent! lua vim.highlight.on_yank { timeout=3000, on_macro=true }
]])

-- Automatically enter Insert mode when terminal is opened.
vim.cmd([[
autocmd TermOpen * startinsert
]])

-- `.prettierignore` uses gitignore syntax.
vim.cmd([[
autocmd BufNewFile,BufRead .prettierignore setlocal filetype=gitignore
]])

-- Per default, Netrw leaves unmodified buffers open. This autocommand deletes
-- Netrw's buffer once it's hidden (using ":q", for example).
vim.cmd([[
autocmd FileType netrw setlocal bufhidden=delete
]])
