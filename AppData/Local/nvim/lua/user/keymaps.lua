-- Modes:
-- normal_mode = 'n',
-- insert_mode = 'i',
-- visual_mode = 'v',
-- visual_block_mode = 'x',
-- term_mode = 't',
-- command_mode = 'c'.



-- Improved keymap function.
local function keymap(modes, from, to, opts)
  for i = 1, #modes do
    local mode = modes:sub(i, i)

    vim.api.nvim_set_keymap(mode, from, to, opts)
  end
end

-- Key Map Recursive.
local function kmr(modes, from, to)
  keymap(modes, from, to, { noremap = false })
end

-- Key Map.
local function km(modes, from, to)
  keymap(modes, from, to, { noremap = true })
end

-- Key Map Silent.
local function kms(modes, from, to)
  keymap(modes, from, to, { noremap = true, silent = true })
end

-- Key Map Silent Recursive.
local function kmsr(modes, from, to)
  keymap(modes, from, to, { noremap = false, silent = true })
end

-- Key Map Silent All.
local function kmsa(from, to)
  kms('nivxtc', from, to)
end



-- PLUGIN MAPPINGS --

-- INFO Free mappings: gb go gu gw gy gz

-- ~/nvim-plugins/my-formatter
-- Just lint.
kms('n', '<Leader>m', '<CMD>MyFormatter<CR>')
-- Write (update).
kms('n', '<C-s>', '<CMD>silent update<CR>')

-- akinsho/bufferline.nvim
-- kms('n', '<A-Right>', '<CMD>BufferLineCycleNext<CR>')
-- kms('n', '<A-Left>', '<CMD>BufferLineCyclePrev<CR>')
-- kms('n', '<Leader>1', '<CMD>lua require("bufferline").go_to_buffer(1, true)<CR>')
-- kms('n', '<Leader>2', '<CMD>lua require("bufferline").go_to_buffer(2, true)<CR>')
-- kms('n', '<Leader>3', '<CMD>lua require("bufferline").go_to_buffer(3, true)<CR>')
-- kms('n', '<Leader>4', '<CMD>lua require("bufferline").go_to_buffer(4, true)<CR>')
-- kms('n', '<Leader>5', '<CMD>lua require("bufferline").go_to_buffer(5, true)<CR>')
-- kms('n', '<Leader>6', '<CMD>lua require("bufferline").go_to_buffer(6, true)<CR>')
-- kms('n', '<Leader>7', '<CMD>lua require("bufferline").go_to_buffer(7, true)<CR>')
-- kms('n', '<Leader>8', '<CMD>lua require("bufferline").go_to_buffer(8, true)<CR>')
-- kms('n', '<Leader>9', '<CMD>lua require("bufferline").go_to_buffer(9, true)<CR>')
-- kms('n', '<Leader>$', '<CMD>lua require("bufferline").go_to_buffer(-1, true)<CR>')
-- kms('n', '<Leader>q', '<CMD>bdelete %<CR>')
-- kms('n', '<Leader>v', '<CMD>vertical sbuffer %<CR>')
-- kms('n', '<Leader>h', '<CMD>split sbuffer %<CR>')

-- TODO goolord/alpha-nvim
-- kms('n', '<C-n>', '<CMD>Alpha<CR>')
-- kyazdani42/nvim-tree.lua
-- kms('n', '<C-t>', '<CMD>NvimTreeToggle<CR>')

-- tpope/vim-unimpaired
-- `[q`, `]q` - `:cprevious` and `:cnext`.
-- `[x`, `]x` - encode/decode XML (and HTML).
-- `[u`, `]u` - encode/decode URLs.
-- `[y`, `]y` - do C String style escaping.
-- Move text up and down.
kmsr('n', '<A-Up>', '[e')
kmsr('n', '<A-Down>', ']e')
kmsr('i', '<A-Up>', '<Esc>[egi')
kmsr('i', '<A-Down>', '<Esc>]egi')
kmsr('v', '<A-Up>', '[egv')
kmsr('v', '<A-Down>', ']egv')

-- numToStr/Comment.nvim
kms('n', '<Leader><Leader>', '<Plug>(comment_toggle_linewise_current)')
kms('v', '<Leader><Leader>', '<Plug>(comment_toggle_linewise_visual)')
-- WARN Uses `\` (which is the leader key)
kms('n', '<C-\\>', '<Plug>(comment_toggle_blockwise_current)')
kms('v', '<C-\\>', '<Plug>(comment_toggle_blockwise_visual)')
-- Inserts comment at the end of line and enters INSERT mode.
kmsr('n', 'gac', 'gcA')
kmsr('n', 'gaf', 'gcAFIXME<Space>')
kmsr('n', 'gat', 'gcATODO<Space>')
kmsr('n', 'gah', 'gcAHACK<Space>')
kmsr('n', 'gaw', 'gcAWARN<Space>')
kmsr('n', 'gap', 'gcAPERF<Space>')
kmsr('n', 'gan', 'gcANOTE<Space>')
kmsr('n', 'gai', 'gcAINFO<Space>')
kmsr('n', 'gad', 'gcADEBUG<Space>')
-- Debug line.
kms('n', '<Leader>l', '"zyyODEBUG<Esc><Plug>(comment_toggle_linewise_current)<Down><Plug>(comment_toggle_linewise_current)"zp')

-- nvim-telescope/telescope.nvim
kms('n', '<Leader>ff', '<CMD>Telescope find_files<CR>')
kms('n', '<Leader>fg', '<CMD>Telescope live_grep<CR>')

-- tpope/vim-surround
-- In linewise visual mode, the surroundings are placed on separate lines and
-- indented. In blockwise visual mode, each line is surrounded.
-- Visual mode: S{
-- cs"<em>
-- ds"
-- <a class="fs-1">text</a> -> cst<i<CR> -> <i class="fs-1">text</i>
-- <a class="fs-1">text</a> -> cst<span> -> <span>text</span>
-- ysiw{ ( ysiw} - without spaces )
-- yss) - the whole line
-- "hello" -> Sfconsole.log<CR> => console.log("hello")
vim.cmd([[
autocmd FileType tex let b:surround_{char2nr('q')} = "``\r''"
" Variable inside a string.
autocmd FileType bash,sh,zsh let b:surround_{char2nr('v')} = "${\r}"
" Quoted variable inside a string.
autocmd FileType bash,sh,zsh let b:surround_{char2nr('V')} = "\\\"${\r}\\\""
" Arrays and other complex data structures.
autocmd FileType bash,sh,zsh let b:surround_{char2nr('C')} = "\\\"$\r\\\""
" PHP and others.
autocmd FileType html,php let b:surround_{char2nr('_')} = "<%= \r =>"
autocmd FileType php let b:surround_{char2nr('e')} = "<?= \r ?>"
autocmd FileType php let b:surround_{char2nr('p')} = "<?php \r ?>"
]])

-- lukas-reineke/indent-blankline.nvim
-- FIXME Update command.
-- for _, tabMap in pairs({
--   'zr',
--   'zR',
--   'zm',
--   'zM',
--   'zo',
--   'zO',
--   'zc',
--   'zC',
--   'za',
--   'zA',
--   'zx',
--   'zX',
--   'zv',
-- }) do
--   kms('n', tabMap, tabMap .. '<CMD>IndentBlanklineRefresh<CR>')
-- end
-- kms('n', '<Tab>', 'za<CMD>IndentBlanklineRefresh<CR>')
kms('n', '<Tab>', 'za') -- DEBUG

-- justinmk/vim-dirvish
-- Normal mode mappings:
-- * Create file: a
-- * Create directory: A
-- * Delete under cursor: dd
-- * Rename under cursor: r
-- * Reload: R
-- * Select (for moving or pasting) under cursor (or visual selection): yy
-- * Paste file to current directory: pp
-- * Move file to current directory: PP
-- * Run :Shdo! (mapping: [count].) to generate a shell script from the arglist.
-- DEBUG Disabled in favor of Netrw.
-- vim.cmd([[
-- " Quit.
-- autocmd FileType dirvish nnoremap <buffer> <Esc> <Plug>(dirvish_quit)
-- ]])
-- kms('n', '<C-n>', '<CMD>tabnew %<CR><CMD>Dirvish<CR><CMD>call OpenFictitiousSplit()<CR>')
-- kms('n', '<BS>', '<Plug>(dirvish_up)')
-- -- Creating an empty buffer.
-- kms('n', '<Leader>st', '<CMD>setlocal splitbelow!<CR><CMD>new<CR><CMD>setlocal splitbelow<CR><CMD>Dirvish<CR>')
-- kms('n', '<Leader>sr', '<CMD>vnew<CR><CMD>Dirvish<CR>')
-- kms('n', '<Leader>sb', '<CMD>new<CR><CMD>Dirvish<CR>')
-- kms('n', '<Leader>sl', '<CMD>setlocal splitright!<CR><CMD>vnew<CR><CMD>setlocal splitright<CR><CMD>Dirvish<CR>')

-- prettier/vim-prettier
-- Linting with return to original view.
vim.cmd([[
function! PrettierFormat() abort
  const winview = winsaveview()

  execute "normal \<Plug>(Prettier)"
  write
  edit

  call winrestview(winview)
endfunction
]])
kms('n', '<Leader>p', '<CMD>call PrettierFormat()<CR>')

-- tommcdo/vim-exchange
-- cx{motion} - define the first {motion} to exchange, then define the second
-- {motion} and perform the exchange (for example, by `.` repeating).
-- cxx - like `cx`, but use the current line.
-- X - like `cx`, but for Visual mode => without `.` repeating.
-- cxc - clear any {motion} pending for exchange.

-- johngrib/vim-game-code-break
-- :VimGameCodeBreak
-- h l space    `         ]        [          q        Q
-- ← → new ball cheat key GOD mode human mode end game quit & close game
-- let g:vim_game_code_break_item_limit = 4    " default value is 2

-- seandewar/nvimesweeper
-- :Nvimesweeper
-- Press ! to flag a square.
-- Press ? to mark a square for later.
-- Press <Space> or <RightMouse> to cycle between !, ? and unmarking a
-- square.
-- Press <CR>, x or <LeftMouse> to reveal a square; just try not to step on
-- a mine!
-- Run :help nvimesweeper for more details.

-- wellle/targets.vim
-- Lots of separators: , . ; : + - = ~ _ * # / | \ & $
-- `b` for brackets, `q` for quotes

-- vim-scripts/argtextobj.vim
-- daa - Delete An Argument
-- cia - Change Inner Argument

-- michaeljsmith/vim-indent-object
-- Text object, based on indentation levels (`a` - around, `i` - indent):
-- Sorted by usefulness:
-- ii - (I)nner (I)ndentation level (no line above).
-- ai - (A)n (I)ndentation level and line above.
-- aI - (A)n (I)ndentation level and lines above/below.

-- glts/vim-textobj-comment
-- ac - a comment including the comment delimiters
-- ic - just the comment content

-- kana/vim-textobj-line
-- al - like 0v$h
-- il - like ^vg_

-- justinmk/vim-sneak
-- `s{char}{char}` - sneaking forward.
-- `S{char}{char}` - sneaking backward.
-- `;` or `,` - continue sneaking.
-- kms('n', 'f', '<Plug>Sneak_s')
-- kms('n', 'F', '<Plug>Sneak_S')
kms('n', 'f', '<Plug>Sneak_f')
kms('n', 'F', '<Plug>Sneak_F')
kms('n', 't', '<Plug>Sneak_t')
kms('n', 'T', '<Plug>Sneak_T')

-- tpope/vim-repeat
kmsr('v', '.', ':normal! .<CR>')

-- lewis6991/gitsigns.nvim
-- INFO See './plugins/gitsigns.lua'.

-- tpope/vim-dispatch
vim.cmd([[
" DEBUG
function! s:compile_run_ts() abort
  let full_path = expand('%:p')
  let without_extension = full_path[:-4]
  let full_path_js = without_extension .. '.js'

  execute 'Dispatch! tsc "' .. full_path .. '" && node "' .. full_path_js .. '"'
endfunction

autocmd FileType typescript nnoremap <buffer> <F5> <CMD>call <SID>compile_run_ts()<CR>

function! s:toggle_dispatch_quick_fix() abort
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    Copen
    execute 'normal G'
  else
    cclose
  endif
endfunction

nnoremap <F2> <CMD>call <SID>toggle_dispatch_quick_fix()<CR>
]])
-- "Dispatch!" and "Make!" mappings.
vim.g.dispatch_no_maps = 1
kms('n', '<F5>', "<CMD>call ExecDefaultShell('Dispatch!')<CR>")
-- FIXME "Dispatch" -> "Start" or ... ?
kms('n', '<F6>', "<CMD>call ExecDefaultShell('Dispatch')<CR>")
-- kms('n', '<F8>', "<CMD>Dispatch<CR><CMD>Copen<CR>")
kms('n', '<F10>', "<CMD>call ExecDefaultShell('Make!')<CR>")
kms('n', '<S-F5>', '<CMD>AbortDispatch<CR>')

-- jose-elias-alvarez/typescript.nvim
kms('n', '<Leader>o', '<CMD>TypescriptAddMissingImports!<CR><CMD>TypescriptOrganizeImports<CR>')

-- google/vim-searchindex
-- Switch and improve search commands.
vim.cmd([[
silent! nmap <silent><unique> n nzz<Plug>SearchIndex
silent! nmap <silent><unique> N Nzz<Plug>SearchIndex
silent! map <unique> * <Plug>ImprovedStar_g*<Plug>SearchIndex
silent! map <unique> # <Plug>ImprovedStar_g#<Plug>SearchIndex
]])

-- neovim/nvim-lspconfig
-- Every autocompletion is manually triggered with omnifunc (<C-x><C-o>).
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<F1>', vim.diagnostic.setloclist, opts)
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
  -- TODO
  -- vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<Leader>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<Leader>R', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<Leader>b', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- tpope/vim-unimpaired
vim.cmd([[
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>
]])

-- tpope/vim-fugitive
-- Open Git panel.
kms('n', '<Leader>g', '<CMD>G<CR>')

-- adoy/vim-php-refactoring-toolbox
vim.g.vim_php_refactoring_use_default_mapping = 0
-- kms('n', '<Leader>rlv', '<CMD>call PhpRenameLocalVariable()<CR>')
-- kms('n', '<Leader>rcv', '<CMD>call PhpRenameClassVariable()<CR>')
-- kms('n', '<Leader>rm', '<CMD>call PhpRenameMethod()<CR>')
-- kms('n', '<Leader>eu', '<CMD>call PhpExtractUse()<CR>')
-- kms('n', '<Leader>ec', '<CMD>call PhpExtractConst()<CR>')
-- kms('n', '<Leader>ep', '<CMD>call PhpExtractClassProperty()<CR>')
-- kms('n', '<Leader>em', '<CMD>call PhpExtractMethod()<CR>')
-- kms('n', '<Leader>np', '<CMD>call PhpCreateProperty()<CR>')
-- kms('n', '<Leader>du', '<CMD>call PhpDetectUnusedUseStatements()<CR>')
-- kms('n', '<Leader>==', '<CMD>call PhpAlignAssigns()<CR>')
-- -- kms('n', '<Leader>sg', '<CMD>call PhpCreateSettersAndGetters()<CR>')
-- -- kms('n', '<Leader>cog', '<CMD>call PhpCreateGetters()<CR>')
-- -- kms('n', '<Leader>da', '<CMD>call PhpDocAll()<CR>')

-- Netrw.
-- Mappings, not shown in "Quick Help".
-- `mF` - unmark all files.
-- `gn` - make top of tree the directory below the cursor.
-- `gh` - quick hide/unhide of dot-files.
vim.cmd([[
augroup my_netrw_mappings
  autocmd!

  " FIXME (see Telegram)
  " autocmd FileType netrw noremap <buffer> a <CMD>normal %<CR>
  " autocmd FileType netrw noremap <buffer> A <CMD>normal d<CR>
  " " FIXME Make a custom command with trash-cli.
  " autocmd FileType netrw noremap <buffer> dd <CMD>normal D<CR>
  " autocmd FileType netrw noremap <buffer> r <CMD>normal R<CR>
  " autocmd FileType netrw noremap <buffer> h <CMD>normal o<CR>
  " autocmd FileType netrw noremap <buffer> o <CMD>normal r<CR>

  autocmd FileType netrw noremap <buffer> <BS> <Plug>VinegarUp
augroup END
]])
kms('n', '<C-n>', '<CMD>tabnew %<CR><CMD>Explore<CR><CMD>call OpenFictitiousSplit()<CR>')
kms('n', '<BS>', '<CMD>Explore<CR>')
-- Creating an empty buffer.
kms('n', '<Leader>st', '<CMD>setlocal splitbelow!<CR><CMD>new<CR><CMD>setlocal splitbelow<CR><CMD>Explore<CR>')
kms('n', '<Leader>sr', '<CMD>vnew<CR><CMD>Explore<CR>')
kms('n', '<Leader>sb', '<CMD>new<CR><CMD>Explore<CR>')
kms('n', '<Leader>sl', '<CMD>setlocal splitright!<CR><CMD>vnew<CR><CMD>setlocal splitright<CR><CMD>Explore<CR>')

-- AndrewRadev/linediff.vim
kmsr('v', '<Leader>L', ':Linediff<CR>')



-- NEOVIM MAPPINGS --
-- Replace only within visual selection.
kms('v', '<A-r>', ":s/\\%V\\%V/<Left><Left><Left><Left>")
-- Replace visual selection.
kms('v', '<C-r>', '"hy:%s/<C-r>h/')
-- Quit.
kms('n', 'Q', '<CMD>qa<CR>')
-- Toggle spell check.
kms('n', '<F11>', '<CMD>set spell!<CR>')
-- Resize with arrows.
kms('n', '<C-S-Up>', '<CMD>resize -2<CR>')
kms('n', '<C-S-Down>', '<CMD>resize +2<CR>')
kms('n', '<C-S-Left>', '<CMD>vertical resize -2<CR>')
kms('n', '<C-S-Right>', '<CMD>vertical resize +2<CR>')
-- Resize splits to be equal width and height.
kms('n', '<Leader>=', '<C-w>=')
-- Maximize a split.
kms('n', '<Leader>+', '<C-w>|')
-- Edit ".vimrc".
-- DEBUG For Dirvish.
-- kmsr('n', '<Leader>V', '<CMD>tabnew ~/.vim/.vimrc<CR><BS>cd<CR><CR><CMD>call OpenFictitiousSplit()<CR>')
kmsr('n', '<Leader>V', '<CMD>tabnew ~/.vim<CR>cd<CMD>e .vimrc<CR><CMD>call OpenFictitiousSplit()<CR>')
-- Open Neovim main configuration directory.
-- DEBUG For Dirvish.
-- kmsr('n', '<Leader>N', '<CMD>tabnew ~/AppData/Local/nvim/lua/user<CR>cd<CMD>call OpenFictitiousSplit()<CR>')
kmsr('n', '<Leader>N', '<CMD>tabnew ~/AppData/Local/nvim/lua/user<CR>cd<CMD>call OpenFictitiousSplit()<CR>')
-- Tags. tag atag tags tAgs
-- Make tags.
kms('n', '<Leader>ct', '<CMD>Dispatch ctags -R .<CR>')
-- Filetype-specific.
-- dosbatch.
vim.cmd([[
augroup my_dosbatch_mappings
  autocmd!

  autocmd FileType dosbatch nmap <buffer><silent> gcA
  \ <CMD>normal! A<Space>&<Space>REM <CR>A
  autocmd FileType dosbatch nmap <buffer><silent> <C-\>
  \ <CMD>normal! IREM <CR>
  autocmd FileType dosbatch vmap <buffer><silent> <C-\>
  \ <CMD>'<,'>normal! IREM <CR>
augroup END
]])
-- Open zsh terminal in new tab.
-- NOTE akinsho/bufferline.nvim => without "tabnew" zsh terminal.
kms('n', '<Leader>t', "<CMD>call ExecInShell('zsh', 'tabnew | terminal')<CR><CMD>tabmove 0<CR>")
kms('n', '<Leader>T', "<CMD>call ExecInShell('zsh', 'terminal')<CR>")
-- Making Vim's regular expressions more sane ("very magic").
km('nv', '/', '/\\v')
km('nv', '?', '?\\v')
-- tyru/open-browser.vim
-- If the plugin finds the URL under the cursor, it will open it, otherwise it
-- looks for a word through Google.
-- NOTE Netrw should be disabled.
kms('nv', 'gx', '<Plug>(openbrowser-smart-search)')
-- Increasing (6 == "^" for up) / decreasing ("v" for down) the selected
-- numbers.
-- By 1:
kms('nv', '<A-6>', '<C-a>')
kms('nv', '<A-v>', '<C-x>')
-- By 1, 2, ... (only in visual mode):
kms('v', '<Leader><A-6>', 'g<C-a>')
kms('v', '<Leader><A-v>', 'g<C-x>')
-- Move current tab.
kms('n', '<M-S-Left>', '<CMD>-tabmove<CR>')
kms('n', '<M-S-Right>', '<CMD>+tabmove<CR>')
-- FIXME Go to N newer entry in jump list (<C-i>, <Tab>).
-- kms('n', '	', '	')
-- Diff mode.
kms('n', '<Leader>wd', '<CMD>windo diffthis<CR>')
kms('n', '<Leader>wD', '<CMD>windo diffoff<CR>')
kms('n', '<Leader>dp', '<CMD>diffput<CR>')
kms('n', '<Leader>dg', '<CMD>diffget<CR>')
-- Duplicating the original buffer.
kms('n', '<Leader>St', '<CMD>setlocal splitbelow!<CR><CMD>split<CR><CMD>setlocal splitbelow<CR>')
kms('n', '<Leader>Sr', '<CMD>vsplit<CR>')
kms('n', '<Leader>Sb', '<CMD>split<CR>')
kms('n', '<Leader>Sl', '<CMD>setlocal splitright!<CR><CMD>vsplit<CR><CMD>setlocal splitright<CR>')
-- Connect to work server.
kms('n', '<Leader>W', '<CMD>e scp://px_web//prosoft/web/www/<CR>')
kms('n', '<C-p>', '<CMD>pwd<CR>')

-- Alternative compilation via command mode.
-- TODO Use `b:dispatch` and add the rest of variables
vim.cmd([[
execute 'augroup my_compilation_mappings'
execute 'autocmd!'

for [filetype, command] in [
  \ ['dosbatch', '"%"'],
  \ ['javascript,typescript', 'node "%"'],
  \ ['python', 'py "%"'],
  \ ['php', 'php "%"'],
  \ ['bash,sh,zsh', 'sh "%"'],
  \ ]
  execute 'autocmd FileType ' .. filetype .. ' nnoremap <buffer> ! <CMD>!' .. command .. '<CR>'
endfor

execute 'augroup END'
]])

return {
  on_attach = on_attach,
}
