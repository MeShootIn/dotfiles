" PLUGINS {{{

" TODO Auto installation of 'vim-plug' for Neovim by 'Windows (PowerShell)'.
call plug#begin('~/AppData/Local/nvim/plugged')
" Fake text.
Plug 'tkhren/vim-fake'
call plug#end()

" }}}

" SETTINGS {{{

" Sessions.
set sessionoptions+=globals,resize,winsize

" Faster redrawing.
set ttyfast
set updatetime=750
set ttimeoutlen=0
set timeoutlen=1000
set redrawtime=10000
set lazyredraw

" For integration with Russian layout.
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" For integration with system buffer.
set clipboard+=unnamedplus

" CLI executor.
set shell=cmd
let g:my_default_shell = &shell

" Disable compatibility with 'vi', which can cause unexpected issues.
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
set nonumber
set norelativenumber
set ruler " Information about the current row, column, etc.

" Enables 24-bit RGB color in the TUI. Uses GUI-highlighting.
if has('termguicolors')
  set termguicolors
  set t_Co=256
endif

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

" Don't raise the security dialog (after certain operations, e.g. ":q", ":e").
set noconfirm

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

" Search down into subfolders. Provides tab-completion for all file-related
" tasks.
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
  endif
endfunction

autocmd BufEnter *.txt call <SID>help_tab()

" After closing the tab, go to the previous tab.
" autocmd TabClosed * tabprevious

" Close current tab.
nnoremap <silent> <Leader>q <CMD>x<CR>

" After closing the tab, go to the left tab.
function! s:improved_tab_closing() abort
  if winnr('$') == 1 && tabpagenr('$') > 1 && tabpagenr() > 1 && tabpagenr() < tabpagenr('$')
    x | tabprevious
  else
    x
  endif
endfunction
nnoremap <silent> <Leader>q <CMD>call <SID>improved_tab_closing()<CR>

" }}}

" MAPPINGS {{{

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

" Clear last search highlighting.
nnoremap <Leader><Esc> <CMD>nohlsearch<CR>
vnoremap <Leader><Esc> <CMD>nohlsearch<CR>

" Move cursor by display lines when wrapping.
" FIXME Long press leaves traces.
" nnoremap <Down> gj
" nnoremap <Up> gk
" vnoremap <Down> gj
" vnoremap <Up> gk
" inoremap <Down> <C-o>gj
" inoremap <Up> <C-o>gk

" Stay in indent mode.
nnoremap <silent> > >>
nnoremap <silent> < <<
vnoremap <silent> > >gv
vnoremap <silent> < <gv

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

" Bash-like keys for the command line.
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <CMD>call setcmdline(getcmdpos() ==# 1 ? '' : getcmdline()[:getcmdpos() - 2])<CR>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Move screen up/down one line.
nnoremap <S-Down> <C-e>
nnoremap <S-Up> <C-y>
inoremap <S-Down> <C-o><C-e>
inoremap <S-Up> <C-o><C-y>
vnoremap <S-Down> <C-e>
vnoremap <S-Up> <C-y>

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

" Terminal-like mappings.
" FIXME Bring into conformity (including current char? + terminal?)
nnoremap <C-u> d0
inoremap <C-u> <C-o>d0
nnoremap <C-k> dg_
inoremap <C-k> <C-o>dg_
nnoremap <C-a> ^
inoremap <C-a> <C-o>^
vnoremap <C-a> ^
nnoremap <C-e> g_
inoremap <C-e> <C-o>g_<C-o>a
vnoremap <C-e> g_

" Smart join from insert mode.
inoremap <C-j> <C-o>J

" TODO Toggle fictitious split.
" FIXME
" 1) Открыть в одном табе - норм
" 2) Открыть в другом табе - resize работает наоборот => buffer-local augroup
function! OpenFictitiousSplit() abort
  topleft vnew .my_fictitious_split
  vertical resize 35
  wincmd p
endfunction

function! s:close_fictitious_split() abort
  bd .my_fictitious_split
endfunction

function! s:toggle_fictitious_split() abort
  if !exists('t:has_fictitious_split')
    let t:has_fictitious_split = v:false
  endif

  if !t:has_fictitious_split
    call OpenFictitiousSplit()
    let t:has_fictitious_split = v:true

    " FIXME Make buffer-local
    augroup my_fictitious_split
      autocmd!

      autocmd BufEnter *.my_fictitious_split execute 'wincmd p'
      " autocmd BufEnter *.my_fictitious_split execute 'echomsg rand(srand())'
    augroup END
  else
    call <SID>close_fictitious_split()
    let t:has_fictitious_split = v:false

    autocmd! my_fictitious_split
  endif
endfunction

" nnoremap <silent> <Leader>gg <CMD>call <SID>toggle_fictitious_split()<CR>
" DEBUG
nnoremap <silent> <Leader>y <CMD>call OpenFictitiousSplit()<CR>

" Start editing the file whose name is under the cursor and jump to the line
" number following the filename.
nnoremap gf gF
vnoremap gf gF
nnoremap gF <C-w>gF<CMD>call OpenFictitiousSplit()<CR>
vnoremap gF <C-w>gF<CMD>call OpenFictitiousSplit()<CR>

" Omnifunc completion.
inoremap <silent> <C-c> <C-x><C-o>

" Paste from buffer (what was so lacking).
inoremap <silent> <C-v> <C-r>*
cnoremap <C-v> <C-r>*

" Alternative paragraph motion mapping.
nmap <silent> <C-Up> {
nmap <silent> <C-Down> }
imap <silent> <C-Up> <C-o>{
imap <silent> <C-Down> <C-o>}
vmap <silent> <C-Up> {
vmap <silent> <C-Down> }

" Paste text with auto alignment.
" NOTE Disabled in favor of ku1ik/vim-pasta plugin.
" nnoremap p p`[v`]=
" nnoremap P P`[v`]=

" }}}

" PLUGIN MAPPINGS AND SETTINGS {{{

" inkarkat/vim-ReplaceWithRegister (vim-scripts/ReplaceWithRegister)
" Paste text with auto alignment.
" NOTE Disabled in favor of ku1ik/vim-pasta plugin.
" vmap p <Plug>ReplaceWithRegisterVisual`[v`]=
" vmap P <Plug>ReplaceWithRegisterVisualgvo<Esc>`[v`]=

" }}}

" MY SNIPPETS {{{

" FIXME Remove after configuration 'L3MON4D3/LuaSnip'.

" Universal.
augroup my_universal_snippets
  autocmd!

  " NOTE Relies on 'numToStr/Comment.nvim' plugin's mapping 'gcc'.
  autocmd FileType * imap <buffer><silent> ;; <C-o>gcc
  autocmd FileType * imap <buffer><silent> ;db DEBUG<Space><C-o>gcc<C-e>
  autocmd FileType * imap <buffer><silent> ;fx FIXME<Space><C-o>gcc<C-e>
  autocmd FileType * imap <buffer><silent> ;ha HACK<Space><C-o>gcc<C-e>
  autocmd FileType * imap <buffer><silent> ;in INFO<Space><C-o>gcc<C-e>
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
  autocmd FileType * imap <buffer><silent> ;nt NOTE<Space><C-o>gcc<C-e>
  autocmd FileType * imap <buffer><silent> ;ok OK<Space><C-o>gcc<C-e>
  autocmd FileType * imap <buffer><silent> ;pr PERF<Space><C-o>gcc<C-e>
  autocmd FileType * imap <buffer><silent> ;td TODO<Space><C-o>gcc<C-e>
  autocmd FileType * imap <buffer><silent> ;ts TEST<Space><C-o>gcc<C-e>
  autocmd FileType * imap <buffer><silent> ;wr WARN<Space><C-o>gcc<C-e>
augroup END

" Vim.
augroup my_vim_snippets
  autocmd!

  autocmd FileType vim imap <buffer><silent> ;ag <Esc>:-1read $HOME/.vim/my_snippets/vim/augroup.vim<CR>i<C-g>
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
augroup END

" Markdown.
augroup my_markdown_snippets
  autocmd!

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
augroup END

" LaTeX.
augroup my_latex_snippets
  autocmd!

  autocmd FileType tex imap <buffer><silent> ;$ $<Space><++><Space>$<Space><++><C-g>
  autocmd FileType tex imap <buffer><silent> ;- ---<Space>
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
augroup END

" HTML.
augroup my_html_snippets
  autocmd!

  autocmd FileType html imap <buffer><silent> ;! <Esc>:-1read $HOME/.vim/my_snippets/html/html5.html<CR>i<C-g>
  autocmd FileType html imap <buffer><silent> ;a <Esc>:-1read $HOME/.vim/my_snippets/html/a.html<CR>i<C-g>
  autocmd FileType html imap <buffer><silent> ;im <Esc>:-1read $HOME/.vim/my_snippets/html/img.html<CR>i<C-g>
  autocmd FileType html imap <buffer><silent> ;is https://via.placeholder.com/320x240
  autocmd FileType html imap <buffer><silent> ;it https://via.placeholder.com/320x240?text=320x240
  autocmd FileType html imap <buffer><silent> ;l <Esc>:-1read $HOME/.vim/my_snippets/html/link_css.html<CR>i<C-g>
  autocmd FileType html imap <buffer><silent> ;og <Esc>:-1read $HOME/.vim/my_snippets/html/optgroup.html<CR>i<C-g>
  autocmd FileType html imap <buffer><silent> ;op <Esc>:-1read $HOME/.vim/my_snippets/html/option.html<CR>i<C-g>
  autocmd FileType html imap <buffer><silent> ;sc <Esc>:-1read $HOME/.vim/my_snippets/html/script_module.html<CR>i<C-g>
  autocmd FileType html imap <buffer><silent> ;se <Esc>:-1read $HOME/.vim/my_snippets/html/select.html<CR>i<C-g>
augroup END

" CSS.
augroup my_css_snippets
  autocmd!

  " Snippets.
  autocmd FileType css,scss imap <buffer><silent> ;b <Esc>:-1read $HOME/.vim/my_snippets/css/border-box.css<CR>i<C-g>
  autocmd FileType css,scss imap <buffer><silent> ;. <Esc>:-1read $HOME/.vim/my_snippets/css/class_selector.css<CR>i<C-g>
  autocmd FileType css,scss imap <buffer><silent> ;# <Esc>:-1read $HOME/.vim/my_snippets/css/id_selector.css<CR>i<C-g>

  " Abbreviations.
  autocmd FileType css,scss :inoreabbrev <buffer> im@ !important
augroup END

" SCSS.
augroup my_scss_snippets
  autocmd!

  " Snippets.
  autocmd FileType scss imap <buffer><silent> ;s <Esc>:-1read $HOME/.vim/my_snippets/scss/strictly_nested.scss<CR>i<C-g>
  autocmd FileType scss imap <buffer><silent> ;$ <Esc>:-1read $HOME/.vim/my_snippets/scss/variable.scss<CR>i<C-g>

  " Abbreviations.
  autocmd FileType scss :inoreabbrev <buffer> in@ #{}<Left>
augroup END


" Lua.
augroup my_lua_snippets
  autocmd!

  autocmd FileType lua imap <buffer><silent> ;p <Esc>:-1read $HOME/.vim/my_snippets/lua/protected_require.lua<CR>i<C-g>
augroup END

" React.
augroup my_react_snippets
  autocmd!

  autocmd FileType typescriptreact,javascriptreact :inoreabbrev <buffer> cn@ className={}<Left>
  autocmd FileType typescriptreact,javascriptreact :inoreabbrev <buffer> och@ onChange={}<Left>
  autocmd FileType typescriptreact,javascriptreact :inoreabbrev <buffer> os@ onSubmit={}<Left>
  autocmd FileType typescriptreact,javascriptreact :inoreabbrev <buffer> ocl@ onClick={}<Left>
  autocmd FileType typescriptreact,javascriptreact :inoreabbrev <buffer> v@ value={}<Left>
augroup END

" JavaScript.
augroup my_javascript_snippets
  autocmd!

  autocmd FileType javascript imap <buffer><silent> ;! <Esc>:-1read $HOME/.vim/my_snippets/js/index.js<CR>i<C-g>
  autocmd FileType javascript imap <buffer><silent> ;cea <Esc>:-1read $HOME/.vim/my_snippets/js/custom_element_autonomous.js<CR>i<C-g>
  autocmd FileType javascript imap <buffer><silent> ;ceb <Esc>:-1read $HOME/.vim/my_snippets/js/custom_element_built-in.js<CR>i<C-g>
augroup END

" PHP.
augroup my_php_snippets
  autocmd!

  " Snippets.
  autocmd FileType php imap <buffer><silent> ;! <Esc>:-1read $HOME/.vim/my_snippets/php/php.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;ae <Esc>:-1read $HOME/.vim/my_snippets/php/alternative_else.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;aei <Esc>:-1read $HOME/.vim/my_snippets/php/alternative_elseif.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;af <Esc>:-1read $HOME/.vim/my_snippets/php/alternative_for.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;afe <Esc>:-1read $HOME/.vim/my_snippets/php/alternative_for_each.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;ai <Esc>:-1read $HOME/.vim/my_snippets/php/alternative_if.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;as <Esc>:-1read $HOME/.vim/my_snippets/php/alternative_switch.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;aw <Esc>:-1read $HOME/.vim/my_snippets/php/alternative_while.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;c <Esc>:-1read $HOME/.vim/my_snippets/php/class.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;dc <Esc>:-1read $HOME/.vim/my_snippets/php/divider_comment.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;ei <Esc>:-1read $HOME/.vim/my_snippets/php/elseif.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;el <Esc>:-1read $HOME/.vim/my_snippets/php/else.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;fe <Esc>:-1read $HOME/.vim/my_snippets/php/for_each.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;fo <Esc>:-1read $HOME/.vim/my_snippets/php/for.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;fu <Esc>:-1read $HOME/.vim/my_snippets/php/function.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;fua <Esc>:-1read $HOME/.vim/my_snippets/php/function_anonymous.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;hc <Esc>:-1read $HOME/.vim/my_snippets/php/header_comment.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;hd <Esc>:-1read $HOME/.vim/my_snippets/php/heredoc.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;if <Esc>:-1read $HOME/.vim/my_snippets/php/if.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;in <Esc>:-1read $HOME/.vim/my_snippets/php/interface.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;m <Esc>:-1read $HOME/.vim/my_snippets/php/multi_line_comment.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;o <Esc>:-1read $HOME/.vim/my_snippets/php/overloading.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;pa <Esc>:-1read $HOME/.vim/my_snippets/php/php_autoload.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;pb <Esc>:-1read $HOME/.vim/my_snippets/php/public_property.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;pt <Esc>:-1read $HOME/.vim/my_snippets/php/protected_property.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;pv <Esc>:-1read $HOME/.vim/my_snippets/php/private_property.php<CR>i<C-g>
  autocmd FileType php imap <buffer><silent> ;tn <Esc>:-1read $HOME/.vim/my_snippets/php/throw_new.php<CR>i<C-g>

  " Abbreviations.
  autocmd FileType php inoreabbrev <buffer> pe@ <?=  ?><Esc>2hi
  autocmd FileType php inoreabbrev <buffer> pc@ <?php  ?><Esc>2hi
  autocmd FileType php inoreabbrev <buffer> r@ return ;<Esc>i
  autocmd FileType php inoreabbrev <buffer> s@ self::
  autocmd FileType php inoreabbrev <buffer> ed@ echo  . '<br>'; // DEBUG<Esc>18hi
augroup END

" Shell.
augroup my_bash_snippets
  autocmd!

  " Snippets.
  autocmd FileType bash,sh,zsh imap <buffer><silent> ;! <Esc>:-1read $HOME/.vim/my_snippets/bash/bash.sh<CR>i<C-g>
  autocmd FileType bash,sh,zsh imap <buffer><silent> ;f <Esc>:-1read $HOME/.vim/my_snippets/bash/function.sh<CR>i<C-g>
augroup END

" }}}
