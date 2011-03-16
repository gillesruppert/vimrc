set nocompatible " must be the first line
" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"""""""""""""""""
"general settings
syntax on
filetype on
filetype plugin on
filetype indent on
let mapleader = ","

" added word chars
set iskeyword+=$
" set iskeyword+=-
set iskeyword+=_ 

" allow buffer to be put in the background without saving
set hidden

" search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

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
set cul " highlights the cursor line
set nowrap
set encoding=utf-8

set visualbell " don't beep
set noerrorbells " don't beep

" do not create swap files!
set nobackup
set noswapfile

set pastetoggle=<F5>
set listchars=tab:>-,trail:-,extends:#,nbsp:%
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" set backspace to act like normal
set backspace=start,indent,eol

" scroll 3 lines before bottom/top
set scrolloff=3

" create a larger history
set history=100

" hide files matching the pattern:
let g:explHideFiles='^\.,.*\.pyc$'

" show autocomplete menus
set wildmenu
set wildmode=list:longest " completion menu behaves more like cli

" display incomplete commands
set showcmd

" show editing mode
set showmode

" set the title within xterm as well
set title

" set status line
set laststatus=2
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \%P\ %{fugitive#statusline()} " set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P

" set colorscheme depending on env
set bg=dark

" gvim don't display the menu or toolbar
set guioptions-=m
set guioptions-=T

if has("gui_running")
	"colorscheme my-wombat
	colorscheme mustang
elseif &t_Co >= 256
  ":let g:CSApprox_loaded = 1
  colorscheme mustang_term
endif

" Font. Very important.
set guifont="Meslo LG S DZ":h12

if has('win32') || has('win64')
	set guifont=Consolas:h13:cANSI
elseif has('unix')
	let &guifont="Monospace:h13"
endif

" set ack as the grep programme
set grepprg=ack\ -ai


"""""""""""""""""
" added filetypes
au BufNewFile,BufRead *.spv set filetype=php "add filetype
au BufNewFile,BufRead *.jqt set filetype=html "add filetype
au BufNewFile,BufRead *.liquid set filetype=xhtml "add filetype
au BufNewFile,BufRead *.json set filetype=json "add filetype


""""""""""""""""""""
" keyboard shortcuts
" edit and save .vimrc quickly
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" added for ruby and rails
" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

" Gundo plugin
map <F5> :GundoToggle<cr>

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

" Buffer next,previous (ctrl-{n,p})
:noremap <c-n> :bn<CR>
:noremap <c-p> :bp<CR>
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

" nerd tree
map <leader>d :NERDTreeToggle<CR>

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

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

" taglist
let Tlist_Ctags_Cmd = '~/.vim/utils/ctags' " set path to ctags utility
let Tlist_WinWidth = 50
let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function'

" Easy Grep options
let g:EasyGrepMode = 2
let g:EasyGrepRecursive = 1

" JavaScriptLint
let jslint_command = '~/.vim/jsl-0.3.0-mac/jsl'
let jslint_command_options = '-nofilelisting -nocontext -nosummary -nologo -conf ~/.vim/jsl-0.3.0-mac/jsl.conf -process'

" Markdown
augroup mkd " add markdown syntax
	autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END


"""""""""""
" vim tools
" create a uuid
imap <c-j>d <c-r>=system('$HOME/.vim/utils/uuid.sh')<cr>

" show hightlighting groups for current word
nmap <leader>sh :call <sid>SynStack()<cr>
function <sid>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" run file with PHP CLI (CTRL-M)
:autocmd FileType php noremap <c-m> :w!<CR>:!/usr/bin/php %<CR>

" PHP parser check
:autocmd FileType php noremap <c-a> :!/usr/bin/php -l %<CR>

" Python settings
:autocmd FileType python set expandtab

" highlight lines that are longer than 80 chars
" highlight OverLength guifg=#ffffff guibg=#740100 gui=NONE
" match OverLength /\%81v.\+/

" put swp files into the tmp dir rather than next to the file!
"set backupdir=$HOME/.vim-tmp,$HOME/.tmp,$HOME/tmp,/var/tmp,/tmp
"set directory=$HOME/.vim-tmp,$HOME/.tmp,$HOME/tmp,/var/tmp,/tmp
