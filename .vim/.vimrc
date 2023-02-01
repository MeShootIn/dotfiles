" PLUGINS {{{

" TODO Auto installation of 'vim-plug' for Neovim by 'Windows (PowerShell)'.
call plug#begin('~/AppData/Local/nvim/plugged')
" Fake text.
Plug 'tkhren/vim-fake'
" Dracula theme.
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" }}}

" SETTINGS {{{

" Dracula theme.
colorscheme dracula

" Sessions.
set sessionoptions+=globals

" Faster redrawing.
set lazyredraw
set ttyfast
set updatetime=750
set ttimeoutlen=0
set timeoutlen=1000
set redrawtime=10000

" For integration with Russian layout.
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" For integration with system buffer.
set clipboard+=unnamedplus

" Command line executor.
set shell=cmd
let g:my_default_shell = 'cmd'

" Disable compatibility with 'vi' which can cause unexpected issues.
set nocompatible

" Certain directories for backups and swaps, but not for undos.
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set noundofile

" Never ring the bell for any reason.
set noerrorbells
set visualbell t_vb=
set tm=500

if exists('&belloff')
  set belloff=all
endif

" Line numbering.
set number
set norelativenumber
set ruler " Information about the current row, column, etc.

" Enables 24-bit RGB color in the TUI. Uses GUI-highlighting.
set termguicolors

" Syntax and files.
syntax enable

" Use new regular expression engine for syntax highlighting.
set re=0

" This is necessary for many plugins to load properly.
filetype plugin indent on

" Encodings and EOLs.
set encoding=utf8
set fileencodings=utf8
set fileformat=unix
set fileformats=unix,dos

" Spell check.
" Useful commands: `]s`, `[s`, `zg`, `z=`.
set nospell " Disabled by default in order to switch later via shortcuts.
set spelllang=en_us,ru_ru
" Usage: move the cursor to the wrong word and press 'z='

" Tabulation.
set autoindent " Copies indents from the current line when adding a new one.
set smartindent " The same as autoindent, but in addition, automatically sets
" indents in the right places.
set tabstop=2 " The number of spaces with which the tab character is displayed
" in the text.
set shiftwidth=2 " To adjust the width of the indents in the spaces.
set softtabstop=2 " The number of spaces that a tab character displays when
" appending.
set expandtab
set smarttab
set shiftround " Always indent by multiple of shiftwidth.

" Mouse.
if has('mouse')
  set mouse=a
endif

set mousehide " Hide mouse cursor while typing.

" TODO WTF???
" if !has('nvim')
"   set ttymouse=xterm-256color " For integration with Alacritty terminal.
" endif

" Vertical bar.
set textwidth=80 " Automatically hard wrap at 80 columns.
set colorcolumn=81
hi ColorColumn ctermbg=red

" Highlight cursor line underneath the cursor horizontally.
set cursorline
" Do not let cursor scroll below or above N number of lines/columns when
" scrolling.
set scrolloff=0
set sidescrolloff=5
" Show partial command you type in the last line of the screen.
set showcmd
" Show the current mode.
set showmode

" Status line.
set statusline='' " Clear status line when config is reloaded.
set completeopt=menu,menuone,noselect
set laststatus=2 " Always show the status line.

" Search.
set hlsearch
set incsearch
set showmatch " Show matching words during a search.
set gdefault " Add the 'g' flag to search/replace by default.
set ignorecase
set wildignorecase
set smartcase " If the search pattern contains upper case characters, it will
" search in a case sensitive manner.

" for regular expressions turn magic on.
set magic

" Sets how many lines of history Vim has to remember.
set history=1000

" Configure backspace so it acts as it should act.
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" TODO https://www.reddit.com/r/neovim/comments/3v06lo/making_the_background_transparent/
autocmd ColorScheme * hi Normal ctermbg=none guibg=none
autocmd ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

" When emoji display errors occur.
set noemoji

" Wrap lines.
set wrap

" Line break.
if has('linebreak')
  let &showbreak = '⤷ ' " Arrow pointing downwards then curving rightwards.

  set linebreak " Wrap long lines at characters in 'breakat'.
  set breakindent " Indent wrapped lines to match start.

  if exists('&breakindentopt')
    set breakindentopt=shift:2 " Emphasize broken lines by indenting them.
  endif
endif

" Don't jump between matching brackets.
set noshowmatch

" Don't autoinsert two spaces after '.', '?', '!' for join command.
set nojoinspaces

" Special chars.
set list
set listchars+=trail:• " Bullet.
set listchars+=tab:▷┅ " White right-pointing triangle.
set listchars=nbsp:⦸ " Circled reverse solidus.

" Allows you to hide buffers with unsaved changes without being prompted.
set hidden

" Shortmess.
set shortmess+=A " Ignore swapfile messages, cuz I always wanna edit it.
set shortmess-=S " Show full count of search matches.

" Wildmenu.
set wildmenu
set wildmode=full

" Splits.
set splitright " Open vertical splits to the right of the current window.
set splitbelow " Open horizontal splits below current window.

" Try to reuse windows/tabs when switching buffers.
set switchbuf=usetab

" Folding.
if has('folding')
  set foldmethod=indent " Not as cool as "syntax", but faster.
  set foldlevelstart=99
endif

if has('virtualedit')
  set virtualedit=block " Allow cursor to move where there is no text in visual
  " block mode.
endif

" Disable restoration of missing <EOL> at the end of file.
if exists('&fixeol')
  set nofixeol
endif

" Provides tab-completion for all file-related tasks.
set path+=**

" Always show tabs.
set showtabline=2

" }}}

" FUNCTIONS {{{

function! ExecInShell(shell, command) abort
  let prev_shell = &shell

  execute 'setlocal shell=' .. a:shell
  execute a:command
  execute 'setlocal shell=' .. prev_shell
endfunction

function! ExecDefaultShell(command) abort
  call ExecInShell(g:my_default_shell, a:command)
endfunction

function! s:visual_selection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" Help in new tabs.
function! s:help_tab() abort
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction

autocmd BufEnter *.txt call <SID>help_tab()

" File short name (without extension).
function! s:file_short_name(file_name) abort
  return split(a:file_name, '\.')[0]
endfunction

" Sets `makeprg` option.
function! s:set_makeprg(compiler) abort
  let full_name = expand('%:t')
  let name = <SID>file_short_name(full_name)

  let makeprg = get({
        \ 'gcc': 'gcc -Wall -o ' .. name .. ' ' .. full_name,
        \ 'g++': 'g++ -Wall -o ' .. name .. ' ' .. full_name,
        \ 'node': 'node "%"',
        \ 'py': 'py "%"',
        \ 'latexmk': 'latexmk -pdf "%"',
        \ }, a:compiler, v:null)

  if makeprg is v:null
    throw 'Unknown compiler "' .. a:compiler .. '" passed to '
          \ .. 's:set_makeprg(compiler) function'
  endif

  execute 'setlocal makeprg=' .. substitute(makeprg, ' ', '\\ ', 'g')
endfunction

function! s:set_run_command(compiler) abort
  let run_command = get({
        \ 'node': '!node "%"',
        \ 'py': '!py "%"',
        \ 'batch': '!"%"',
        \ }, a:compiler, v:null)

  if run_command is v:null
    throw 'Unknown compiler "' .. a:compiler .. '" passed to s:run(compiler) '
          \ .. 'function'
  endif

  nnoremap <buffer> <F5> <CMD>call g:ExecDefaultShell(run_command)<CR>
endfunction

function! s:compile_run_ts() abort
  let full_path = expand('%:p')
  let without_extension = full_path[:-4]
  let full_path_js = without_extension .. '.js'

  execute 'Dispatch! tsc "' .. full_path .. '" && node "' .. full_path_js .. '"'
endfunction

function! s:fictitious_split() abort
  topleft vnew
  vertical resize 35
  wincmd l
endfunction

" }}}

" MAPPINGS {{{

" TODO Make functions for key bindings.

" Leader key.
let mapleader = '\'
let maplocalleader = '\'
nnoremap <silent> <Leader> <nop>
vnoremap <silent> <Leader> <nop>
xnoremap <silent> <Leader> <nop>
nnoremap <silent> <LocalLeader> <nop>
vnoremap <silent> <LocalLeader> <nop>
xnoremap <silent> <LocalLeader> <nop>

" Disables.
noremap <PageUp> <nop>
noremap! <PageUp> <nop>
noremap <PageDown> <nop>
noremap! <PageDown> <nop>
noremap <Home> <nop>
noremap! <Home> <nop>
noremap <End> <nop>
noremap! <End> <nop>

" Additional functionality for `<Esc>`: clear last search highlighting.
" DEBUG
" nnoremap <Esc> <Esc><CMD>nohlsearch<CR>
" inoremap <Esc> <Esc><CMD>nohlsearch<CR>
" vnoremap <Esc> <Esc><CMD>nohlsearch<CR>

" Clear last search highlighting.
nnoremap <Leader><Esc> <CMD>nohlsearch<CR>
inoremap <Leader><Esc> <CMD>nohlsearch<CR>
vnoremap <Leader><Esc> <CMD>nohlsearch<CR>

" Move cursor by display lines when wrapping.
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
noremap $ g$
" Remap Vim's 0 to first non-blank character.
noremap 0 g^

" Stay in indent mode.
nnoremap <silent> > >>
" nnoremap <silent> <Tab> >>
nnoremap <silent> < <<
" nnoremap <silent> <S-Tab> <<
vnoremap <silent> > >gv
" vnoremap <silent> <Tab> >gv
vnoremap <silent> < <gv
" vnoremap <silent> <S-Tab> <gv

" For snippet lookup.
inoremap <C-g> <Esc>/<++><CR>"_c4l

" Space as usual.
nnoremap <Space> a<Space><Esc>

" Toggle case without moving cursor.
nnoremap ~ g~l

" Out of habit.
nnoremap <S-u> <C-r>
nnoremap <C-z> u

" Go Edit (word).
nnoremap ge "_ciw

" Delete and change without copying to register.
nnoremap x "_x
nnoremap X "_X
nnoremap d "_d
nnoremap D "_D
nnoremap c "_c
nnoremap C "_C
vnoremap d "_d
vnoremap D "_D
vnoremap c "_c
vnoremap C "_C

" Exit insert mode in terminal mode.
tnoremap <Esc> <C-\><C-n>

" Visual mode pressing `*` or `#` searches for the current selection.
vnoremap <silent> * :<C-u>call <SID>visual_selection('', '')<CR>/<C-R>=@/<CR><CR>N
vnoremap <silent> # :<C-u>call <SID>visual_selection('', '')<CR>?<C-R>=@/<CR><CR>N

" Bash like keys for the command line.
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Move screen up/down one line.
nnoremap <S-Down> <C-e>
nnoremap <S-Up> <C-y>
inoremap <S-Down> <C-o><C-e>
inoremap <S-Up> <C-o><C-y>
vnoremap <S-Down> <Esc><C-e>gv
vnoremap <S-Up> <Esc><C-y>gv

" Switch and improve search commands.
nnoremap * g*N
nnoremap # g#N

" Enter as usual.
nnoremap <CR> o<Esc>
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" For better scrolling.
nnoremap <C-f> <C-d><C-d>
nnoremap <C-b> <C-u><C-u>

" Toggle folding.
nnoremap <Tab> za

" Navigate between tabs.
nnoremap <A-Left> gT
nnoremap <A-Right> gt
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
nnoremap <Leader>0 <CMD>tablast<CR>

" Toggle between 2 most recent tabs.
autocmd TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <A-l> <CMD>execute 'tabn ' . g:lasttab<CR>
vnoremap <silent> <A-l> <CMD>execute 'tabn ' . g:lasttab<CR>

" Splits.
nnoremap <Leader>sh <CMD>split<CR>
nnoremap <Leader>sv <CMD>vsplit<CR>

" Save and quit.
nnoremap <Leader>q <CMD>x<CR>

" Start editing the file whose name is under the cursor and jump to the line
" number following the filename.
nnoremap gf gF
nnoremap gF <C-w>gf

" Clear lines (dot-repeatable).
nnoremap <Leader>c "_cc<Esc>
vnoremap <Leader>c :normal! "_cc<CR>

" Terminal-like mappings.
nnoremap <C-u> d0
inoremap <C-u> <C-o>d0
nnoremap <C-k> d$
inoremap <C-k> <C-o>d$
nnoremap <C-a> ^
inoremap <C-a> <C-o>^
vnoremap <C-a> ^
nnoremap <C-e> $
inoremap <C-e> <C-o>$
vnoremap <C-e> $

" Smart join from insert mode.
inoremap <C-j> <C-o>J

" Almost analogous to center alignment.
nnoremap <silent> <Leader>g <CMD>call <SID>fictitious_split()<CR>

" }}}

" PLUGIN MAPPINGS AND SETTINGS {{{

" vim-scripts/ReplaceWithRegister
vmap p gr
vmap P grgvo<Esc>

" }}}

" MY SNIPPETS {{{

" FIXME Remove after configuration 'L3MON4D3/LuaSnip'.

" All.
" NOTE Relies on 'numToStr/Comment.nvim' plugin's mapping '<Leader><Leader>'.
autocmd FileType * imap <buffer><silent> ;; <C-o><Leader><Leader>
autocmd FileType * imap <buffer><silent> ;db DEBUG<Esc><Leader><Leader>A<Space>
autocmd FileType * imap <buffer><silent> ;fx FIXME<Esc><Leader><Leader>A<Space>
autocmd FileType * imap <buffer><silent> ;in INFO<Esc><Leader><Leader>A<Space>
autocmd FileType * imap <buffer><silent> ;li1 <Esc>:-1read $HOME/.vim/my_snippets/all/li1<CR>
autocmd FileType * imap <buffer><silent> ;li10 <Esc>:-1read $HOME/.vim/my_snippets/all/li10<CR>
autocmd FileType * imap <buffer><silent> ;li11 <Esc>:-1read $HOME/.vim/my_snippets/all/li11<CR>
autocmd FileType * imap <buffer><silent> ;li12 <Esc>:-1read $HOME/.vim/my_snippets/all/li12<CR>
autocmd FileType * imap <buffer><silent> ;li13 <Esc>:-1read $HOME/.vim/my_snippets/all/li13<CR>
autocmd FileType * imap <buffer><silent> ;li14 <Esc>:-1read $HOME/.vim/my_snippets/all/li14<CR>
autocmd FileType * imap <buffer><silent> ;li15 <Esc>:-1read $HOME/.vim/my_snippets/all/li15<CR>
autocmd FileType * imap <buffer><silent> ;li16 <Esc>:-1read $HOME/.vim/my_snippets/all/li16<CR>
autocmd FileType * imap <buffer><silent> ;li17 <Esc>:-1read $HOME/.vim/my_snippets/all/li17<CR>
autocmd FileType * imap <buffer><silent> ;li18 <Esc>:-1read $HOME/.vim/my_snippets/all/li18<CR>
autocmd FileType * imap <buffer><silent> ;li19 <Esc>:-1read $HOME/.vim/my_snippets/all/li19<CR>
autocmd FileType * imap <buffer><silent> ;li2 <Esc>:-1read $HOME/.vim/my_snippets/all/li2<CR>
autocmd FileType * imap <buffer><silent> ;li20 <Esc>:-1read $HOME/.vim/my_snippets/all/li20<CR>
autocmd FileType * imap <buffer><silent> ;li3 <Esc>:-1read $HOME/.vim/my_snippets/all/li3<CR>
autocmd FileType * imap <buffer><silent> ;li4 <Esc>:-1read $HOME/.vim/my_snippets/all/li4<CR>
autocmd FileType * imap <buffer><silent> ;li5 <Esc>:-1read $HOME/.vim/my_snippets/all/li5<CR>
autocmd FileType * imap <buffer><silent> ;li6 <Esc>:-1read $HOME/.vim/my_snippets/all/li6<CR>
autocmd FileType * imap <buffer><silent> ;li7 <Esc>:-1read $HOME/.vim/my_snippets/all/li7<CR>
autocmd FileType * imap <buffer><silent> ;li8 <Esc>:-1read $HOME/.vim/my_snippets/all/li8<CR>
autocmd FileType * imap <buffer><silent> ;li9 <Esc>:-1read $HOME/.vim/my_snippets/all/li9<CR>
autocmd FileType * imap <buffer><silent> ;nt NOTE<Esc><Leader><Leader>A<Space>
autocmd FileType * imap <buffer><silent> ;td TODO<Esc><Leader><Leader>A<Space>
autocmd FileType * imap <buffer><silent> ;wr WARN<Esc><Leader><Leader>A<Space>

" Vim.
autocmd FileType vim imap <buffer><silent> ;bc <Esc>:-1read $HOME/.vim/my_snippets/vim/block_comment.vim<CR>i<C-g>
autocmd FileType vim imap <buffer><silent> ;cb ;bc
autocmd FileType vim imap <buffer><silent> ;co <Esc>:-1read $HOME/.vim/my_snippets/vim/const.vim<CR>i<C-g>
autocmd FileType vim imap <buffer><silent> ;de ;ed
autocmd FileType vim imap <buffer><silent> ;ec <Esc>:-1read $HOME/.vim/my_snippets/vim/echo.vim<CR>i<C-g>
autocmd FileType vim imap <buffer><silent> ;ed <Esc>:-1read $HOME/.vim/my_snippets/vim/echo_debug.vim<CR>i<C-g>
autocmd FileType vim imap <buffer><silent> ;em <Esc>:-1read $HOME/.vim/my_snippets/vim/echo_msg.vim<CR>i<C-g>
autocmd FileType vim imap <buffer><silent> ;fa <Esc>:-1read $HOME/.vim/my_snippets/vim/function_abort.vim<CR>i<C-g>
autocmd FileType vim imap <buffer><silent> ;fc <Esc>:-1read $HOME/.vim/my_snippets/vim/function_closure.vim<CR>i<C-g>
autocmd FileType vim imap <buffer><silent> ;fore <Esc>:-1read $HOME/.vim/my_snippets/vim/for_each.vim<CR>i<C-g>
autocmd FileType vim imap <buffer><silent> ;fori <Esc>:-1read $HOME/.vim/my_snippets/vim/for_items.vim<CR>i<C-g>
autocmd FileType vim imap <buffer><silent> ;fork <Esc>:-1read $HOME/.vim/my_snippets/vim/for_keys.vim<CR>i<C-g>
autocmd FileType vim imap <buffer><silent> ;forv <Esc>:-1read $HOME/.vim/my_snippets/vim/for_values.vim<CR>i<C-g>
autocmd FileType vim imap <buffer><silent> ;fr <Esc>:-1read $HOME/.vim/my_snippets/vim/function_range.vim<CR>i<C-g>
autocmd FileType vim imap <buffer><silent> ;ie <Esc>:-1read $HOME/.vim/my_snippets/vim/if_else.vim<CR>i<C-g>
autocmd FileType vim imap <buffer><silent> ;if <Esc>:-1read $HOME/.vim/my_snippets/vim/if.vim<CR>i<C-g>
autocmd FileType vim imap <buffer><silent> ;la <Esc>:-1read $HOME/.vim/my_snippets/vim/lambda.vim<CR>i<C-g>
autocmd FileType vim imap <buffer><silent> ;le <Esc>:-1read $HOME/.vim/my_snippets/vim/let.vim<CR>i<C-g>
autocmd FileType vim imap <buffer><silent> ;t <Esc>:-1read $HOME/.vim/my_snippets/vim/try.vim<CR>i<C-g>

" Markdown.
autocmd FileType markdown imap <buffer><silent> ;! <Esc>:-1read $HOME/.vim/my_snippets/md/!.md<CR>i<C-g>
autocmd FileType markdown imap <buffer><silent> ;b <Esc>:-1read $HOME/.vim/my_snippets/md/bold.md<CR>i<C-g>
autocmd FileType markdown imap <buffer><silent> ;cb <Esc>:-1read $HOME/.vim/my_snippets/md/code_block.md<CR>i<C-g>
autocmd FileType markdown imap <buffer><silent> ;ci <Esc>:-1read $HOME/.vim/my_snippets/md/cite.md<CR>i<C-g>
autocmd FileType markdown imap <buffer><silent> ;d ;n
autocmd FileType markdown imap <buffer><silent> ;e <Esc>:-1read $HOME/.vim/my_snippets/md/emphatic.md<CR>i<C-g>
autocmd FileType markdown imap <buffer><silent> ;img <Esc>:-1read $HOME/.vim/my_snippets/md/image.md<CR>i<C-g>
autocmd FileType markdown imap <buffer><silent> ;imt <Esc>:-1read $HOME/.vim/my_snippets/md/image_title.md<CR>i<C-g>
autocmd FileType markdown imap <buffer><silent> ;it <Esc>:-1read $HOME/.vim/my_snippets/md/italic.md<CR>i<C-g>
autocmd FileType markdown imap <buffer><silent> ;li <Esc>:-1read $HOME/.vim/my_snippets/md/link.md<CR>i<C-g>
autocmd FileType markdown imap <buffer><silent> ;lt <Esc>:-1read $HOME/.vim/my_snippets/md/link_title.md<CR>i<C-g>
autocmd FileType markdown imap <buffer><silent> ;n &ndash;
autocmd FileType markdown imap <buffer><silent> ;o <Esc>:-1read $HOME/.vim/my_snippets/md/ordered_list.md<CR>i<C-g>
autocmd FileType markdown imap <buffer><silent> ;q <Esc>:-1read $HOME/.vim/my_snippets/md/quote.md<CR>i<C-g>
autocmd FileType markdown imap <buffer><silent> ;r <Esc>:-1read $HOME/.vim/my_snippets/md/reference.md<CR>i<C-g>
autocmd FileType markdown imap <buffer><silent> ;t ;lt
autocmd FileType markdown imap <buffer><silent> ;u <Esc>:-1read $HOME/.vim/my_snippets/md/unordered_list.md<CR>i<C-g>

" LaTeX.
autocmd FileType tex imap <buffer><silent> ;$ $<Space><++><Space>$<Space><++><C-g>
autocmd FileType tex imap <buffer><silent> ;- ---
autocmd FileType tex imap <buffer><silent> ;-> \rightarrow
autocmd FileType tex imap <buffer><silent> ;<- \leftarrow
autocmd FileType tex imap <buffer><silent> ;<-> \leftrightarrow
autocmd FileType tex imap <buffer><silent> ;<= \Leftarrow
autocmd FileType tex imap <buffer><silent> ;<=> \Leftrightarrow
autocmd FileType tex imap <buffer><silent> ;=> \Rightarrow
autocmd FileType tex imap <buffer><silent> ;[ \[\<Esc>i<CR><++><CR><C-g>
autocmd FileType tex imap <buffer><silent> ;] ;[
autocmd FileType tex imap <buffer><silent> ;d <Esc>:-1read $HOME/.vim/my_snippets/tex/declare_math_operator.tex<CR>i<C-g>
autocmd FileType tex imap <buffer><silent> ;nc <Esc>:-1read $HOME/.vim/my_snippets/tex/new_command.tex<CR>i<C-g>
autocmd FileType tex imap <buffer><silent> ;ne <Esc>:-1read $HOME/.vim/my_snippets/tex/new_environment.tex<CR>i<C-g>
autocmd FileType tex imap <buffer><silent> ;r <Esc>:-1read $HOME/.vim/my_snippets/tex/renew_command.tex<CR>i<C-g>
autocmd FileType tex imap <buffer><silent> ;u <Esc>:-1read $HOME/.vim/my_snippets/tex/use_package.tex<CR>i<C-g>

" HTML.
autocmd FileType html imap <buffer><silent> ;h <Esc>:-1read $HOME/.vim/my_snippets/html/html5.html<CR>i<C-g>
autocmd FileType html imap <buffer><silent> ;is https://via.placeholder.com/320x240
autocmd FileType html imap <buffer><silent> ;it https://via.placeholder.com/320x240?text=320x240

" Lua.
autocmd FileType lua imap <buffer><silent> ;p <Esc>:-1read $HOME/.vim/my_snippets/lua/protected_require.lua<CR>i<C-g>

" }}}

" MAKEPRG {{{

" FIXME autocmd FileType javascript call <SID>set_makeprg('node')
" FIXME autocmd FileType python call <SID>set_makeprg('py')
" autocmd FileType c call <SID>set_makeprg('gcc')
" autocmd FileType cpp call <SID>set_makeprg('g++')
" autocmd FileType javascript call <SID>set_run_command('node')
" autocmd FileType python call <SID>set_run_command('py')
" autocmd FileType tex call <SID>set_makeprg('latexmk')
" autocmd FileType dosbatch call <SID>set_run_command('batch')

" DEBUG
autocmd FileType javascript nnoremap <F5> <CMD>!node "%"<CR>
autocmd FileType typescript nnoremap <buffer> <F5> <CMD>call <SID>compile_run_ts()<CR>

" }}}
