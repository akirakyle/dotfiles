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

Plugin 'Valloric/YouCompleteMe'
"provides autocompletion more info at: https://github.com/Valloric/YouCompleteMe

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

syntax on
set number	  " display line numbers
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set textwidth=80  " lines longer than 80 columns will be broken
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
set hlsearch            " highlight matches
" nnoremap <leader><space> :nohlsearch<CR>    " turns off search highlight

function! RunPython(winWidth)
	execute 'w'
	let filePath = expand('%:p')
	if !bufexists('python')
		execute a:winWidth.'vnew'
		execute 'silent file python'
		setlocal buftype=nofile
		setlocal bufhidden=hide
		setlocal noswapfile
	endif
	if bufwinnr('python') == -1
		execute a:winWidth.'vsplit python'
	endif
	execute bufwinnr('python').'wincmd w'
	execute 'silent %d'
	execute 'silent 0r !python '.'"'.filePath.'"'
 	"execute 'normal G dd'
	execute 'wincmd p'
endfunction
map <C-b> :call RunPython(90) <CR>
