local options = {
  writebackup = false, -- If a file is being edited by another program (or was
  -- written to file while editing with another program), it is not allowed to
  -- be edited.
}

vim.opt.shortmess:append 'c'

for k, v in pairs(options) do
  vim.opt[k] = v
end



-- For improved navigation through '.lua' files
vim.opt_local.suffixesadd:prepend('.lua')
vim.opt_local.suffixesadd:prepend('init.lua')
vim.opt_local.path:prepend(vim.fn.stdpath('config') .. '/lua')

-- Netrw.
-- Disable netrw in favor of "justinmk/vim-dirvish".
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Netrw file explorer settings.
vim.cmd([[
" let g:netrw_banner = 0 " Hide banner above files.
let g:netrw_browse_split = 3 " Vertical split window when <CR> pressed on file.
let g:netrw_liststyle = 3 " Tree instead of plain view.
let g:netrw_list_hide = netrw_gitignore#Hide() " Hide anything ignored by Git.
]])

-- Providers.
vim.g.python3_host_prog = 'C:/Python312/python.exe'

-- Replace the annoying `~` with a `∅`.
vim.cmd([[
set fillchars+=eob:∅
]])

-- One dollar on PHP variables.
-- https://phpactor.readthedocs.io/en/master/lsp/vim.html#two-dollars-on-variables
vim.cmd([[
autocmd FileType php set iskeyword+=$
]])



-- PLUGIN OPTIONS --

-- nvim-treesitter/nvim-treesitter
-- Workaround.
vim.api.nvim_create_autocmd(
  { 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' },
  {
    group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
    callback = function()
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
    end,
  }
)

-- tpope/vim-dispatch
vim.cmd([[
augroup my_vim_dispatch
  autocmd!

  autocmd FileType c let b:dispatch = 'gcc -Wall -o "' .. split(expand('%:t'), '\.')[0] .. '" ' .. '"%"'
  autocmd FileType cpp let b:dispatch = 'g++ -Wall -o "' .. split(expand('%:t'), '\.')[0] .. '" ' .. '"%"'
  autocmd FileType dosbatch let b:dispatch = '"%"'
  autocmd FileType javascript,typescript let b:dispatch = 'node "%"'
  autocmd FileType python let b:dispatch = 'py "%"'
  autocmd FileType php let b:dispatch = 'php "%"'
augroup END
]])
