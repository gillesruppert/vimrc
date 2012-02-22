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

set scrolloff=3            " scroll 3 lines before bottom/top
set autoread               " set to auto read when a file is changed from the outside
"set mouse=a                " allow for full mouse support
set autowrite
set showcmd                " display incomplete commands
set hidden                 " allow buffer to be put in the background without saving

set spelllang=en,es                 " set spell check language
set wildmenu               " show autocomplete menus
set wildmode=list:longest,list:full " completion menu behaves more like cli
set wildignore+=*.o,.git,.svn,node_modules

set iskeyword+=$,_         " added word chars

" show line number, cursor position
set number
set ruler
set cursorline             " highlights the cursor line
set nowrap
set linebreak              " this will not break whole words while wrap is enabled
set showbreak=…

" search settings
set hlsearch               " highlight search things
set incsearch              " go to search results as typing
set smartcase              " but case-sensitive if expression contains a capital letter.
set ignorecase             " ignore case when searching
set gdefault               " assume global when searching or substituting
set magic                  " set magic on, for regular expressions
set showmatch              " show matching brackets when text indicator is over them

set lazyredraw             " don't redraw screen during macros
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

" show line number, cursor position
set number
set ruler
set cul                    " highlights the cursor line
set backspace=start,indent,eol " set backspace to act like normal
set nowrap
set encoding=utf-8

set visualbell             " don't beep
set noerrorbells           " don't beep
set noeb vb t_vb=          " disable audio and visual bells
au GUIEnter * set vb t_vb=

" do not create swap files!
set nobackup
set nowritebackup
set noswapfile

set pastetoggle=<F5>
set listchars=tab:>-,trail:-,extends:#,nbsp:%
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" vim 7.3 features
if v:version >= 703
    set undofile
    set undodir=$HOME/.vim/.undo
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
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \%P\ %{fugitive#statusline()}

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

" gvim don't display the menu or toolbar
set guioptions-=m
set guioptions-=T
" gvim don't show scrollbars
set guioptions-=r
set guioptions-=L


"""""" colour scheme
" set t_Co=256
set background=dark
colorscheme solarized

" folding
set foldenable                   " enable folding
set foldmethod=marker            " detect triple-{ style fold markers
set foldlevel=99


"""""""""""""""""
" added filetypes
au BufNewFile,BufRead *.jqt set filetype=html
au BufNewFile,BufRead *.scss set filetype=css
au BufNewFile,BufRead *.liquid set filetype=html
au BufNewFile,BufRead *.json set filetype=json


" settings for folding comments
au BufNewFile,BufRead *.cpp,*.c,*.h,*.java,*.js syn region myCComment start="/\*\*" end="\*/" fold keepend transparent


""""""""""""""""""""
" keyboard shortcuts
" edit and save .vimrc quickly
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" map Y to match C and D behavior
nnoremap Y y$
" yank entire file (global yank)
nmap gy ggVGy

" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

" fast window switching
map <leader>w <C-W>w
" cycle between buffers
map <leader>. :b#<cr>

" pull word under cursor into lhs of a substitute (for quick search and replace)
nmap <leader>r :%s#\<<C-r>=expand("<cword>")<CR>\>#

" format json
autocmd FileType json nmap <leader>f :%!python -m json.tool<cr>

" strip all trailing whitespace 
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType c,cpp,python,ruby,java,html,css,json,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" insert path of current file into a command
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" save with ,,
inoremap <leader>, <esc>:w<cr>
nnoremap <leader>, :w<cr>

" save readonly files with w!!
cmap w!! w !sudo tee % >/dev/null

" save & restore sessions
map <c-s> :mksession! <cr>
map <c-o> :source Session.vim <cr>

" switch search highighting off temporaril
nmap <silent> <leader>/ :nohlsearch<CR>

" escape out of insert mode with jk
inoremap jk <Esc>

" autocomplete shortcut to ctrol-space
imap <c-space> <c-x><c-o>

" swaps ' ` for easier bookmark return
nnoremap ' `
nnoremap ` '

" swap ; : for easier commands
nnoremap ; :

" Vertical split then hop to new buffer
:noremap <leader>v :vsp<CR>
:noremap <leader>h :split<CR>

" Make current window the only one
:noremap <leader>O :only :tabo<CR>
:noremap <leader>o :only<CR>

" move cursor to next row rather than line. Good when wrapping is on
nnoremap j gj
nnoremap k gk

" folds
:noremap <leader>z f{zf%
:noremap zx za

" remapping folds
nnoremap zo zO
nnoremap zO zo

" error next,previous (ctrl-{n,p})
:noremap <c-n> :cn<CR>
:noremap <c-p> :cp<CR>
" Buffer delete (ctrl-c)
:noremap <c-q> :bd<CR>

" remap going through windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-c>j <c-w>j<c-w>c<c-w>k
map <c-c>k <c-w>k<c-w>c<c-w>j
map <c-c>l <c-w>l<c-w>c<c-w>h
map <c-c>h <c-w>h<c-w>c<c-w>l


" show invisible chars
nmap <silent> <leader>i :set nolist!<CR>

" taglist
map <leader>l :TlistToggle<CR>
map <F8> :!~/.vim/utils/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Task
inoremap <silent> <buffer> <C-D-CR> <ESC>:call Toggle_task_status()<CR>i
noremap <silent> <buffer> <C-D-CR> :call Toggle_task_status()<CR>


""""""""""""""""
" Plugin settings
" automatically close tag as needed
"au Filetype html,xml,xsl,php,spv,phtml source $HOME/.vim/scripts/closetag.vim

" nerd tree
map <leader>d :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>
map <leader>nm :NERDTreeMirror<CR>
let g:NERDChristmasTree=1
"let g:NERDTreeShowHidden=1

" Gundo plugin
map <F5> :GundoToggle<cr>

" fugitive
map <leader>gs :Gstatus<cr>
map <leader>gl :Glog<cr>
map <leader>gd :Gdiff<cr>

" Command-T
let g:CommandTMaxHeight=20

" Ack
" set grepprg=ack
" nnoremap <leader>a :Ack<space>
" let g:ackhighlight=1
" let g:ackprg="ack -H --type-set jade=.jade --type-set stylus=.styl --type-set coffee=.coffee --nocolor --nogroup --column --ignore-dir=node_modules -G '^((?!min\.).)*$'"
" let g:ackprg="ack -H --column --nocolor --nogroup"

" Easy Grep options
let g:EasyGrepInvertWholeWord=1 " ,vv searches for whole word
" let g:EasyGrepMode = 2
" let g:EasyGrepRecursive = 1

" set ack as the grep programme
" set grepprg=ack\ -ai


" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

" taglist
let Tlist_Ctags_Cmd = '~/.vim/utils/ctags' " set path to ctags utility
let Tlist_WinWidth = 50
let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function'

" Markdown
augroup mkd " add markdown syntax
	autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

" mustache
autocmd VimEnter,BufNewFile,BufRead *.mustache set nofoldenable
autocmd VimEnter,BufNewFile,BufRead *.js set foldmethod=manual

" gundo
if !has("python")
 let g:gundo_disable = 1
endif

"JavaScript Syntax
let g:javascript_ignore_javaScriptdoc = 1

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': '',
  \ }


"Syntastic settings
let g:syntastic_javascript_checker="jshint"
let g:syntastic_auto_loc_list=2 " close location list automatically
"let g:syntastic_mode_map = { 'mode': 'active',
                           "\ 'active_filetypes': ['ruby', 'php'],
                           "\ 'passive_filetypes': ['html', 'jqt'] }

" call the jshint config loader script for syntastic
:autocmd FileType javascript source $HOME/.vim/jshint-config-loader.vim

:autocmd FileType python set expandtab

"""""""""""
" vim tools
" create a uuid
imap <c-j>d <c-r>=system('$HOME/.vim/utils/uuid.sh')<cr>

" Python settings
:autocmd FileType python set expandtab

" insert the current working directory
iabbrev <silent> CWD <C-R>=getcwd()<CR>
