" full vim
set nocompatible " must be the first line

" pathogen
filetype off
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()
filetype plugin indent on


"""""""""""""""""
"general settings
syntax on
let mapleader = ","

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

" line wrapping for automatic wrapping
"set wrap
"set tw=80
"set fo=cqt
"set wm=0

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

" be quiet
set visualbell             " don't beep
set noerrorbells           " don't beep
set noeb vb t_vb=          " disable audio and visual bells
au GUIEnter * set vb t_vb=

" do not create swap files!
set nobackup
set nowritebackup
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


set history=100 " create a larger history

" hide files matching the pattern:
let g:explHideFiles='^\.,.*\.pyc$'

" show editing mode
set showmode

" set the title within xterm as well
set title

" set status line
set laststatus=2
let g:Powerline_symbols='fancy'

" gvim don't display the menu or toolbar
set guioptions-=m
set guioptions-=T

" gvim don't show scrollbars
set guioptions-=r
set guioptions-=L


"""""" colour scheme & fonts
" set t_Co=256
set background=dark
colorscheme solarized
if has('gui_running')
  "set guifont=Meslo\ LG\ S\ DZ:h14
  set guifont=Source\ Code\ Pro:h14
endif

" folding
set foldenable                   " enable folding
set foldmethod=manual            " detect triple-{ style fold markers
set foldlevel=99


"""""""""""""""""
" added filetypes
au BufNewFile,BufRead *.scss set filetype=scss
au BufNewFile,BufRead *.liquid set filetype=html
au BufNewFile,BufRead *.jqt set filetype=html
au BufNewFile,BufRead *.twig set filetype=html
au BufNewFile,BufRead *.cshtml set filetype=html
au BufNewFile,BufRead *.mustache set filetype=html
au BufNewFile,BufRead *.json set filetype=json
" Markdown
"autocmd BufRead *.md  setlocal ai formatoptions=tcroqan nonu spell textwidth=80 comments=n:> ft=markdown
autocmd BufRead *.md  setlocal ai nonu textwidth=80 comments=n:> ft=markdown
autocmd BufRead *.mkd  setlocal ai formatoptions=tcroqan nonu spell textwidth=80 comments=n:> ft=markdown
" Dokuwiki
autocmd BufRead *.dw  set ai formatoptions=tcroqan comments=n:> ft=dokuwiki
" git commit
autocmd Filetype gitcommit setlocal spell textwidth=72
" jshintrc
autocmd BufNewFile,BufRead .jshintrc set filetype=json

" settings for folding comments
au BufNewFile,BufRead *.cpp,*.c,*.h,*.java,*.js syn region myCComment start="/\*\*" end="\*/" fold keepend transparent


"au FileType javascript call JavaScriptFold()


""""""""""""""""""""
" keyboard shortcuts
" edit and save .vimrc quickly
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

nnoremap Y y$                  " map Y to match C and D behavior
nmap gy ggVGy                  " yank entire file (global yank)

"nnoremap <Space> @q " replay q macro

" pull word under cursor into lhs of a substitute (for quick search and replace)
nmap <leader>r :%s#\<\(<C-r>=expand("<cword>")<CR>\)\>#
" switch search highighting off temporaril
nmap <silent> <leader>/ :nohlsearch<CR>

" insert path of current file into a command
cmap <c-p> <c-r>=expand("%:p:h") . "/" <cr>
" insert full path of current file into a command
cmap <c-f> <c-r>=expand("%:p")<cr>

" save with ,,
inoremap <leader>, <esc>:w<cr>
nnoremap <leader>, :w<cr>

" escape out of insert mode with jk
inoremap jk <Esc>

" swaps ' ` for easier bookmark return
nnoremap ' `
nnoremap ` '

" swap ; : for easier commands
nnoremap ; :

" move cursor to next row rather than line. Good when wrapping is on
nnoremap j gj
nnoremap k gk

" save readonly files with w!!
cmap w!! w !sudo tee % >/dev/null

" save & restore sessions
map <c-s> :mksession! <cr>
map <c-o> :source Session.vim <cr>

" autocomplete shortcut to ctrol-space
imap <c-space> <c-x><c-o>

map <leader>w <C-W>w           " fast window switching
map <leader>. :b#<cr>          " cycle between buffers

" Vertical split then hop to new buffer
:noremap <leader>v :vsp<CR>
:noremap <leader>h :split<CR>

" Make current window the only one
:noremap <leader>O :only :tabo<CR>
:noremap <leader>o :only<CR>

" remap going through windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-c>j <c-w>j<c-w>c<c-w>k
map <c-c>k <c-w>k<c-w>c<c-w>j
map <c-c>l <c-w>l<c-w>c<c-w>h
map <c-c>h <c-w>h<c-w>c<c-w>l

"tabs
map <c-t>n :tabnew<cr>
map <c-t>h :tabprevious<cr>
map <c-t>j :tabnext<cr>
map <c-t>c :tabclose<cr>

" folds
:noremap <leader>zz zf%
:noremap <leader>zf f{zf%
:noremap zx za

" error next,previous (ctrl-{n,p})
:noremap <c-n> :cn<cr>
:noremap <c-p> :cp<cr>

" show invisible chars
nmap <silent> <leader>i :set nolist!<CR>


""""""""""""""""
" Plugin settings
" nerd tree
map <leader>d :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>
map <leader>nm :NERDTreeMirror<CR>
let g:NERDChristmasTree=1
"let g:NERDTreeShowHidden=1

" ultisnips
let g:UltiSnipsNoPythonWarning = 1
let g:UltiSnipsEditSplit='vertical'
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
map <leader>u :UltiSnipsEdit<cr>

" taglist
"nmap <F8> :TagbarToggle<CR>

" ctrlp plugin (because c-p is used for other things)
:noremap <c-f> :CtrlP<cr>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|cache$\|node_modules$\|bower_components$\|components$\|vendor$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': '',
  \ }
let g:ctrlp_root_markers = ['.my_app']



"localvimrc
"let g:localvimrc_sandbox=0
let g:localvimrc_ask=0

" Gundo plugin
map <F6> :GundoToggle<cr>

" fugitive
map <leader>gs :Gstatus<cr>
map <leader>gl :Glog<cr>
map <leader>gd :Gdiff<cr>

" Ack
" set grepprg=ack\ -ai " set ack as the grep programme
"let g:ackprg="ack -H --type-set jade=.jade --type-set stylus=.styl --type-set coffee=.coffee --type-set html=.jqt --nocolor --nogroup --column --ignore-dir=node_modules -G '^((?!min\.).)*$'"
 let g:ackprg="ack --smart-case -H --nocolor --nogroup --column"

nnoremap <leader>a :Ack<space>
map <leader>c :Ack '\b<C-r>=expand("<cword>")<CR>\b'<space><cr>
let g:ackhighlight=1

" Easy Grep options
let g:EasyGrepInvertWholeWord=1 " ,vv searches for whole word
"let g:EasyGrepMode=2
let g:EasyGrepRecursive=1


" taglist
"let Tlist_Ctags_Cmd = '~/.vim/utils/ctags' " set path to ctags utility
"let Tlist_WinWidth = 50
"let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function'

" gundo
if !has("python")
 let g:gundo_disable = 1
endif

"Syntastic settings
let g:syntastic_javascript_checker="jshint"
let g:syntastic_auto_loc_list=2 " close location list automatically
"let g:syntastic_mode_map = { 'mode': 'active',
                           "\ 'active_filetypes': ['ruby', 'php'],
                           "\ 'passive_filetypes': ['html', 'jqt'] }

" surround plugin
autocmd FileType php let b:surround_45 = "<?php \r ?>"


"""""""""""""""
" filetype specific

" remove trailing whitespace
autocmd FileType c,cpp,python,ruby,java,html,twig,css,scss,json,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" format json
autocmd FileType json nmap <leader>f :%!python -m json.tool<cr>
" format xml
command! PrettyXML call DoPrettyXML()

" jscomplete 
autocmd FileType javascript
  \ :setl omnifunc=jscomplete#CompleteJS
let g:jscomplete_use = ['dom', 'moz']

" nodejs complete
let g:node_usejscomplete=1

" mustache
autocmd VimEnter,BufNewFile,BufRead *.mustache set nofoldenable

"JavaScript Syntax
let g:javascript_ignore_javaScriptdoc = 1

" call the jshint config loader script for syntastic
:autocmd FileType javascript source $HOME/.vim/jshint-config-loader.vim

" Python settings
:autocmd FileType python set expandtab
:autocmd FileType python set shiftwidth=4
:autocmd FileType python set tabstop=4
:autocmd FileType python set softtabstop=4

"""""""""""
" vim tools
" create a uuid
imap <c-j>d <c-r>=system('$HOME/.vim/utils/uuid.sh')<cr>

"refresh browser"
nnoremap <F5> :silent execute "!python $HOME/.vim/utils/browserrefresh.py &"<cr> :redraw!<cr>

" run npm tests
nnoremap <leader>t :!npm test<cr>

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

"pretty xml
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's
  easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation,
  which is one extra level
  " too deep due to the extra tags we
  wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction

