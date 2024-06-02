"VIMRC FILE
set nocompatible		"required
filetype off		"required for vundle

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale'
Plugin 'nvie/vim-flake8'
Plugin 'preservim/nerdtree'
"Plugin 'NLKNguyen/papercolor-theme'

"All of your Plugins must be added before the following line
call vundle#end()		"required
filetype plugin indent on	"required
"To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief Help
" :PluginList		- lists configured plugins
" :PluginInstall	- installs plugins
" :PluginSearch foo	- searches for foo
" :PluginClean		- confirms removal of unused plugins
"
" see :h vundle for more detail or wiki or faq
" Put your non-Plugin stuff after this line
"=====================================
"COLORS
"=====================================
set termguicolors	        " Enable true colors
set t_Co=256		        " Needed to work in Ubuntu colors
set background=dark
let g:PaperColor_Theme_Options = {
       \   'theme': {
       \     'default.dark': {
       \       'allow_bold': 1,
       \       'allow_italic': 0,
       \       'transparent_background': 1
       \     }
       \   },
       \   'language': {
       \     'python': {
       \       'highlight_builtins' : 1
       \     },
       \     'c': {
       \       'highlight_builtins' : 1
       \     },
       \     'cpp': {
       \       'highlight_standard_library': 1
       \     }
       \   }
       \ }

colorscheme PaperColor      " Set colorscheme, (molokai, solarized, PaperColor)

"======================================
" BASIC SETTINGS
"======================================
"filetype plugin on			" enable plugins file type detected
set nocompatible			" Disable compatability with Vi
filetype on				    " Vim will try and detect file type
filetype indent on			" Load indent file for file type
syntax on				    " Use $VIMRUNTIME/syntax/ if not using 'mine'
"syntax enable              " Turn on if you want to use syntax file in ~/.vim/syntax
"set syntax=mine            " Turn on if you want to use syntax file in ~/.vim/syntax
set number				    " Add line numbers to file

let python_highlight_all = 1
" let g:python_highlight_string_format = 1
" let g:python_highlight_builtin_objs = 1

let g:ale_linters = {'python':['flake8']}

"======================================
"CODE FOLDING
"======================================
set foldlevel=99			" Fold code after 99 lines
set foldmethod=indent		" Lines with equal indent form fold
"set foldmethod=manual      " Folds are created manually

":sp <filename> open specified file above current file & split horizontally
":vsp <filename> will open specified file to the left & split screen vertically
"zF --> Create a fold for count of lines
"{Visual}zf --> Create a fold, only works with foldmethod=manual
"za --> When on closed fold; OPEN it
"zo --> Open one fold under the cursor
"zc --> Close one fold under the cursor

"======================================
"PYTHON SETTINGS
"======================================
au BufNewFile, BufRead *.py
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set textwidth=79
	\ set expandtab
	\ set autoindent
	\ set fileformat=unix

"======================================
"JAVASCRIPT, HTML, CSS
"======================================
au BufNewFile, BufRead *.js, *.html, *.css
	\ set tabstop=2
	\ set softtabstop=2
	\ set shiftwidth=2

"=====================================
"NORMAL EDITING
"=====================================
set cursorline		        " Highlight cursor line under cursor, horizontally
set cursorcolumn	        " Highlight cursor line under cursor, vertically
set shiftwidth=4	        " Shift width to 4 spaces
set tabstop=4		        " Tab width to 4 spaces
set softtabstop=4	        " Number of spaces <TAB> counts for while editing
set textwidth=79	        " Number of characters in a line
set expandtab		        " Use space characters instead of tabs
set autoindent		        " Copy indent from previous line
set smartindent		        " Smart, auto-indenting ({})
set fileformat=unix	        " Fileformat ==Unix, not Dos, or Mac
set encoding=utf-8	        " Should be default
set nobackup		        " Do NOT save backup files
set scrolloff=10	        " Number of lines (10) above/below for cursor scroll
set nowrap		            " Do NOT wrap text, allow text to extend far as line
set showcmd		            " Show partial command you typed in last line, screen
set showmode		        " Show the mode you are in (Insert, Visual, Replace)
set showmatch		        " Show matching words, brackets 
set title		            " Show title, in console title bar
set history=1000	        " Number of commands saved in 'history'
set wildmenu		        " Enable auto completion menu after pressing <TAB>
set wildmode=list:longest	" Make wildmenu behave like Bash Completion
" wildmenu with Ignore file types so as NOT TO EDIT WITH VIM
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"=====================================
"SEARCHING & PATTERNS
"=====================================
set hlsearch		        " Highlight when searching
set incsearch		        " Highlight matching characters, when searching
set ignorecase		        " Ignore capital letters, when searching
set smartcase		        " Override 'ignorecase', search for CAPITAL letters

"=====================================
"STATUS LINE
"=====================================
set laststatus=2	                " Show status on 2nd to last line
set statusline=                     " Clear status line when vimrc is reloaded
set statusline+=\ %F\ %M\ %Y\ %R	" Left side (\file path\modifiable(+)\filetype\readonly)
set statusline+=%=                  " Right align the following:
set statusline+=\[%{&fileformat}\]  " File format
set statusline+=\ %{&encoding}      " File encoding
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set statusline+=\                   " Add a whitespace at the end

"=====================================
" MAPPINGS
" map_mode <what_you_type> <what_is_executed>
"===================================== 
" nnoremap --> Map keys in NORMAL mode
" inoremap --> Map keys in INSERT mode
" vnoremap --> Map keys in VISUAL mode
"======================================

" NERDTREE MAPPINGS
nnoremap <C-n> :NERDTree <cr>           " Open nerdtree
nnoremap <C-t> :NERDTreeToggle <cr>     " Toggle nerdtree
nnoremap <C-f> :NERDTreeFocus <cr>      " Focus nerdtree

nnoremap py :!clear <CR>:!python3 %
nnoremap <F4> :w <CR>:terminal python3 %    " This opens new window each time"
inoremap jj <esc>		    " Press j twice to exit INSERT-mode
nnoremap <c-j> <c-w>j       " CTRL + j, move to split screen below
nnoremap <c-k> <c-w>k       " CTRL + k, move to split screen above
nnoremap <c-l> <c-w>l       " CTRL + l, move to split screen right
nnoremap <c-h> <c-w>h       " CTRL + h, move to split screen left"
