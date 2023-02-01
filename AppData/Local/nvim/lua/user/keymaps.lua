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
  keymap(modes, from, to, {})
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
  keymap(modes, from, to, { silent = true })
end

-- Key Map Silent All.
local function kmsa(from, to)
  kms('nivxtc', from, to)
end



-- INFO Free mappings: gh gl gb gc go gu gw gy gz

-- PLUGIN MAPPINGS --
-- yuki-uthman/virtual-echo.nvim
-- kms('n', '<Leader>r', '<Plug>(vimpad-on)<Plug>(vimpad-refresh)')
-- ~/nvim-plugins/my-formatter
-- Just lint.
kms('n', '<Leader>m', '<CMD>exec "MyFormatter"<CR>')
-- Update = format + update + source.
kms('n', '<Leader>w', '<CMD>exec "MyFormatter" | update | source %<CR>')
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
--
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
kmsr('n', 'ga', 'gcA')
-- nvim-telescope/telescope.nvim
kms('n', '<Leader>ff', '<CMD>Telescope find_files<CR>')
kms('n', '<Leader>fg', '<CMD>Telescope live_grep<CR>')
-- tpope/vim-surround
-- Visual mode: S{
-- cs"<em>
-- ds"
-- cst (change surrounding tag ...)
-- ysiw{ ( ysiw} - without spaces )
-- yss) - the whole line
-- Sfconsole.log<CR> ( => `console.log("hello")` )
vim.cmd([[
autocmd FileType tex let b:surround_{char2nr('q')} = "``\r''"
autocmd FileType html let b:surround_{char2nr('_')} = "<%= \r =>"
]])
-- lukas-reineke/indent-blankline.nvim
for _, km in pairs({
  'zr',
  'zR',
  'zm',
  'zM',
  'zo',
  'zO',
  'zc',
  'zC',
  'za',
  'zA',
  'zx',
  'zX',
  'zv',
}) do
  kms('n', km, km .. '<CMD>IndentBlanklineRefresh<CR>')
end
kms('n', '<Tab>', 'za<CMD>IndentBlanklineRefresh<CR>')
-- ntpeters/vim-better-whitespace
kms('n', '<Leader>s', '<CMD>StripWhitespace<CR>')
-- justinmk/vim-dirvish
-- Normal mode mappings:
-- * Create file: a
-- * Create directory: A
-- * Delete under cursor: dd
-- * Rename under cursor: r
-- * Select (for moving or pasting) under cursor (or visual selection): yy
-- * Paste file to current directory: pp
-- * Move file to current directory: PP
vim.cmd([[
" Quit.
autocmd FileType dirvish nnoremap <buffer> <Esc> <Plug>(dirvish_quit)
" Up the directory tree.
autocmd FileType dirvish nnoremap <buffer> <BS> <Plug>(dirvish_up)
]])
kms('n', '<C-n>', '<CMD>tabnew<CR><CMD>Dirvish<CR>')
-- prettier/vim-prettier
kms('n', '<Leader>p', '<Plug>(Prettier)')
-- tommcdo/vim-exchange
-- cx{motion} - define the first {motion} to exchange, then define the second
-- {motion} and perform the exchange (for example, by `.` repeating).
-- cxx - like `cx`, but use the current line.
-- X - like `cx`, but for Visual mode => without `.` repeating.
-- cxc - clear any {motion} pending for exchange.
--
-- johngrib/vim-game-code-break
-- :VimGameCodeBreak
-- h l space    `         ]        [          q        Q
-- ← → new ball cheat key GOD mode human mode end game quit & close game
-- let g:vim_game_code_break_item_limit = 4    " default value is 2
--
-- seandewar/nvimesweeper
-- :Nvimesweeper
-- Press ! to flag a square.
-- Press ? to mark a square for later.
-- Press <Space> or <RightMouse> to cycle between !, ? and unmarking a
-- square.
-- Press <CR>, x or <LeftMouse> to reveal a square; just try not to step on
-- a mine!
-- Run :help nvimesweeper for more details.
--
-- wellle/targets.vim
-- Lots of separators: , . ; : + - = ~ _ * # / | \ & $
-- `b` for brackets, `q` for quotes
--
-- vim-scripts/argtextobj.vim
-- daa - Delete An Argument
-- cia - Change Inner Argument
--
-- michaeljsmith/vim-indent-object
-- Text object, based on indentation levels (`a` - around, `i` - indent):
-- Sorted by usefulness:
-- ii - (I)nner (I)ndentation level (no line above).
-- ai - (A)n (I)ndentation level and line above.
-- aI - (A)n (I)ndentation level and lines above/below.
--
-- glts/vim-textobj-comment
-- ac - a comment including the comment delimiters
-- ic - just the comment content
--
-- kana/vim-textobj-line
-- al - like 0v$h
-- il - like ^vg_
--
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
--
-- tpope/vim-dispatch
vim.cmd([[
" Toggle QuickFix.
function! s:toggle_quickfix() abort
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    Copen
  else
    cclose
  endif
endfunction

nnoremap <silent> <F1> <CMD>call <SID>toggle_quickfix()<CR>
]])
-- "Dispatch!" and "Make!" mappings.
vim.g.dispatch_no_maps = 1
kms('n', '<F5>', "<CMD>call ExecDefaultShell('Dispatch!')<CR>")
kms('n', '<F10>', "<CMD>call ExecDefaultShell('Make!')<CR>")
kms('n', '<S-F5>', '<CMD>AbortDispatch<CR>')

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
kms('n', '<Leader>V', '<CMD>tabnew ~/.vim/.vimrc<CR>')
-- Open Neovim main configuration directory.
kms('n', '<Leader>N', '<CMD>tabnew ~/AppData/Local/nvim/lua/user/plugins<CR>')
-- Tags.
-- Make tags.
kms('n', '<Leader>t', '<CMD>Ctags<CR>')
-- Filetype-specific.
-- dosbatch.
vim.cmd([[
autocmd FileType dosbatch nmap <buffer><silent> gcA
  \ <CMD>normal! A<Space>&<Space>REM <CR>A
autocmd FileType dosbatch nmap <buffer><silent> <C-\>
  \ <CMD>normal! IREM <CR>
autocmd FileType dosbatch vmap <buffer><silent> <C-\>
  \ <CMD>'<,'>normal! IREM <CR>
]])
-- Netrw mappings.
-- `mf` - mark a file.
-- `mF` - unmark files.
-- `-` - makes Netrw go up one directory.
-- `v` - Enter the file/directory under the cursor in a new vertical split.
-- `gn` - make top of tree the directory below the cursor.
-- `gh` - quick hide/unhide of dot-files.
-- `d` - make a directory.
-- `%` - open a new file in netrw's current directory.
-- `r` - rename the designated file(s)/directory(ies).
-- `D` - remove the file(s)/directory(ies).
-- `x` - view file with an associated program.
-- `qf` - display information on file.
-- `I` - toggle the displaying of the banner.
