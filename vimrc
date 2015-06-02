set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Keep Plugin commands between vundle#begin/end.

" provides autocompletion 
Plugin 'Valloric/YouCompleteMe'

" lets vim run python and see output asynchronously
"Plugin 'akyle9/vimRunPython'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" close YCM's extra info window after leaving insert
let g:ycm_autoclose_preview_window_after_insertion=1 

let mapleader = ","

autocmd BufRead *.py nnoremap <leader>e :w \| silent execute"!clear;python -i %" \| redraw!<CR>

syntax on
set number	  " display line numbers
set ruler
set backspace=indent,eol,start " allow backspacing over everything in insert mode
"set textwidth=80  " lines longer than 80 columns will be broken
set colorcolumn=80
highlight ColorColumn ctermbg=235 guibg=#2c2d27
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
set cursorline    " highlight current line
set wildmenu      " visual autocomplete for command menu
set splitright 	  " opens vert split windows from the right
set incsearch           " search as characters are entered
set foldmethod=indent    "set code folding to fold on indents
set nofoldenable         " so code isn't folded when file is opened
"set hlsearch            " highlight matches
" nnoremap <leader><space> :nohlsearch<CR>    " turns off search highlight
inoremap jj <Esc>
