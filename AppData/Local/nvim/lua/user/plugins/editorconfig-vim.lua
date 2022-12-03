-- To work well with `tpope/vim-fugitive`.
vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*' }

-- DEBUG
vim.cmd([[
augroup _editorconfig
autocmd BufEnter * :EditorConfigReload
augroup END
]])
