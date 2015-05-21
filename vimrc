" full vim
set nocompatible " must be the first line

" pathogen
filetype off
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()
filetype plugin indent on

let g:fb_default_opts = 0
source $ADMIN_SCRIPTS/master.vimrc
source $ADMIN_SCRIPTS/vim/biggrep.vim

"""""""""""""""""
"general settings
syntax on
let mapleader = ","
let maplocalleader = "\\"

set modeline
set modelines=15
set scrolloff=3            " scroll 3 lines before bottom/top
set autoread               " set to auto read when a file is changed from the outside
set autowrite
set showcmd                " display incomplete commands
set hidden                 " allow buffer to be put in the background without saving

set spelllang=en           " set spell check language

set wildmenu               " show autocomplete menus
set wildmode=list:longest,list:full " completion menu behaves more like cli
set wildignore+=*.o,tags,Session.vim

set iskeyword+=$,_         " added word chars

" show line number, cursor position
set number
set ruler
set cursorline             " highlights the cursor line
set nowrap
set linebreak              " this will not break whole words while wrap is enabled
set showbreak=…
set backspace=start,indent,eol " set backspace to act like normal
set encoding=utf-8

" search settings
set hlsearch               " highlight search things
set incsearch              " go to search results as typing
set ignorecase             " ignore case when searching
set smartcase              " but case-sensitive if expression contains a capital letter.
set gdefault               " assume global when searching or substituting
set magic                  " set magic on, for regular expressions
set showmatch              " show matching brackets when text indicator is over them

"set lazyredraw             " don't redraw screen during macros
set ttyfast                " improves redrawing for newer computers
set fileformats=unix,mac,dos

" indent settings
set autoindent
set smartindent

" tab settings
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set shiftround

" be quiet
set visualbell             " don't beep
set noerrorbells           " don't beep
set noeb vb t_vb=          " disable audio and visual bells
au GUIEnter * set vb t_vb=

" do not create swap files!
set nobackup
set writebackup
set backupcopy=no
set noswapfile

set pastetoggle=<F7>
set listchars=tab:‣\ ,trail:-,extends:#,nbsp:%,eol:¬
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" vim 7.3 features
if v:version >= 703
    set undodir=$HOME/.vim/.undo
    set undofile
    set undolevels=1000
    set undoreload=10000
    set colorcolumn=80    " show a right margin column
endif


set history=1000 " create a larger history

" hide files matching the pattern:
let g:explHideFiles='^\.,.*\.pyc$'

" show editing mode
set showmode

" set the title within xterm as well
set title

" set status line
set laststatus=2

" gvim don't display the menu or toolbar
set guioptions-=m
set guioptions-=T

" gvim don't show scrollbars
set guioptions-=r
set guioptions-=L


"""""" colour scheme & fonts
set t_Co=256
set background=dark
colorscheme solarized
if has('gui_running')
  set guifont=Source\ Code\ Pro\ for\ Powerline:h14
endif

" folding
set foldenable                   " enable folding
set foldmethod=manual            " detect triple-{ style fold markers
set foldlevel=99


"""""""""""""""""
" added filetypes
au BufNewFile,BufRead *.json set filetype=json
au BufNewFile,BufRead *.jsx set filetype=javascript

" Markdown
autocmd BufRead *.md  setlocal ai nonu textwidth=80 comments=n:> ft=markdown
autocmd BufRead *.mkd  setlocal ai formatoptions=tcroqan nonu spell textwidth=80 comments=n:> ft=markdown

" git commit
autocmd Filetype gitcommit setlocal spell textwidth=72

"au FileType javascript call JavaScriptFold()
autocmd FileType javascript setlocal foldmethod=manual


""""""""""""""""""""
" keyboard shortcuts
" edit and save .vimrc quickly
nnoremap <silent> <leader>ev :vsplit $HOME/.vim/vimrc<cr>
nnoremap <silent> <leader>sv :so $HOME/.vim/vimrc<cr>

" map Y to match C and D behavior
nnoremap Y y$
" yank entire file (global yank)
nnoremap gy ggVGy

" swap lines
noremap _ ddkP
noremap - ddp

" pull word under cursor into lhs of a substitute (for quick search and replace)
nnoremap <leader>r :%s#\<\(<C-r>=expand("<cword>")<CR>\)\>#

"sort
nnoremap <leader>as :'<,'>sort i<CR>

" switch search highighting off temporaril
nnoremap <silent> <leader>/ :nohlsearch<CR>

" insert path of current file into a command
cnoremap <c-p> <c-r>=expand("%:p:h") . "/" <cr>
" insert full path of current file into a command
cnoremap <c-f> <c-r>=expand("%:p")<cr>

" save with ,,
inoremap <leader>, <esc>:w<cr>
nnoremap <leader>, :w<cr>

" escape out of insert mode with jk
inoremap jk <Esc>

" uppercase in insert mode
inoremap <c-u> <esc>viwUea

" swaps ' ` for easier bookmark return
nnoremap ' `
nnoremap ` '

" swap ; : for easier commands
nnoremap ; :

" move cursor to next row rather than line. Good when wrapping is on
nnoremap j gj
nnoremap k gk

" save readonly files with w!!
cnoremap w!! w !sudo tee % >/dev/null

" autocomplete shortcut to ctrol-space
inoremap <c-space> <c-x><c-o>

noremap <leader>w <C-W>w           " fast window switching
noremap <leader>. :b#<cr>          " cycle between buffers

" Vertical split then hop to new buffer
:noremap <leader>v :vsp<CR>
:noremap <leader>h :split<CR>

" Make current window the only one
:noremap <leader>O :only :tabo<CR>
:noremap <leader>o :only<CR>

" remap going through windows
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
"noremap <c-c>j <c-w>j<c-w>c<c-w>k
"noremap <c-c>k <c-w>k<c-w>c<c-w>j
"noremap <c-c>l <c-w>l<c-w>c<c-w>h
"noremap <c-c>h <c-w>h<c-w>c<c-w>l

"tabs
noremap <leader>mn :tabnew<cr>
noremap <leader>mj :tabprevious<cr>
noremap <leader>mk :tabnext<cr>
noremap <leader>mc :tabclose<cr>

" folds
:noremap <leader>zz zf%
:noremap <leader>zf f{zf%
:noremap zx za
:noremap zb zf%

" show invisible chars
nnoremap <silent> <leader>i :set nolist!<CR>


""""""""""""""""
" Plugin settings
" nerd tree
noremap <leader>d :NERDTreeToggle<CR>
noremap <leader>nf :NERDTreeFind<CR>
let g:NERDChristmasTree=1


" Unite
" Use fuzzy matching in native Unite filters
call unite#filters#matcher_default#use(['matcher_fuzzy'])

let g:unite_source_history_yank_enable = 1
nnoremap <silent> <leader>y :Unite -quick-match history/yank<cr>

" Quickly jump between open buffers
nnoremap <silent> <leader>b :Unite -start-insert -buffer-name=buffer buffer<cr>

" FB-only
nnoremap <silent> <leader>k :call FBBigGrep()<cr>

" Speed up file_rec when there are lots of candidates
let g:unite_redraw_hold_candidates = 1000

" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"nnoremap <c-p> :Unite file_rec/async<cr>
"nnoremap <space>/ :Unite grep:.<cr>
"nnoremap <space>y :Unite history/yank<cr>
"nnoremap <space>s :Unite -quick-match buffer<cr>
"
"nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
"nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
"nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
"nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
"nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
"nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

"nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
"nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
"nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
"nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
"nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
"nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
function! FBBigGrep()
  call inputsave()
  let q = input("TBGS>>  ")
  call inputrestore()
  if q == ""
    return
  endif

  let query = substitute(q, ' ', '\\ ', 'g')
  let q2 = substitute(query, ':', '\\:', 'g')
  exec 'Unite -no-split -start-insert -buffer-name=tbgs biggrep:' . q2
  return
endfunction

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" command-t
nnoremap <c-f> :CommandT<cr>
let g:CommandTMaxFiles=1000000000
let g:CommandTMaxDepth=50
let g:CommandTMaxHeight = 30
let g:CommandTInputDebounce = 100
let g:CommandTFileScanner = 'watchman'

" TBGS
nnoremap <leader>b :TBGS 
nnoremap <leader>bb :TBGS <C-r>=expand("<cword>")<CR><cr>
nnoremap <leader>bf :TBGS providesModule 
nnoremap <leader>] :TBGS providesModule <C-r>=expand("<cword>")<CR><cr>
nnoremap <leader>[ :TBGS require('<C-r>=expand("<cword>")<CR><cr>


"localvimrc
let g:localvimrc_ask=0

" Gundo plugin
noremap <F6> :GundoToggle<cr>

" fugitive
noremap <leader>gs :Gstatus<cr>
noremap <leader>gl :Glog<cr>
noremap <leader>gd :Gdiff<cr>

" Ack/ag
set grepprg=ag\ -ai " set ag as the grep programme

nnoremap <leader>a :Ag<space>
noremap <leader>c :Ag '\b<C-r>=expand("<cword>")<CR>\b'<space><cr>
noremap <leader>ac :Ag '\b<C-r>=expand("<cword>")<CR>\b'<space>html/js/ads<cr>
noremap <leader>ar :Ag '@providesModule\s\b<C-r>=expand("<cword>")<CR>\b'<space>html/js/ads/powereditor<cr>
let g:aghighlight=1

" gundo
if !has("python")
 let g:gundo_disable = 1
endif

" surround plugin
autocmd FileType php let b:surround_45 = "<?php \r ?>"

" airline plugin
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'solarized'

" old vim-powerline symbols
"if !exists('g:airline_symbols')
  "let g:airline_symbols = {}
"endif
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

" GitGutter plugin
nnoremap <leader>gg :GitGutterToggle<cr>

"syntastic
let g:syntastic_mode_map = { 'mode' : 'passive',
                           \ 'active_filetypes': [''],
                           \ 'passive_filetypes': [''] }
let g:syntastic_javascript_checkers = ['jshint']


"""""""""""""""
" filetype specific

" remove trailing whitespace
autocmd FileType c,cpp,python,ruby,java,html,twig,css,scss,json,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" format json
autocmd FileType json nnoremap <leader>f :%!jsonlint<cr>

:autocmd FileType javascript set foldmethod=manual

" Python settings
:autocmd FileType python set expandtab
:autocmd FileType python set shiftwidth=4
:autocmd FileType python set tabstop=4
:autocmd FileType python set softtabstop=4

"""""""""""
" vim tools
" insert the current working directory
iabbrev <silent> CWD <c-r>=getcwd()

"save on focus lost
:au FocusLost * :wa

" strip all trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

