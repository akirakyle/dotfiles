set nocompatible              " be iMproved, required

let mapleader = ","

syntax on
set number	  " display line numbers
set ruler     " show cursor position all the time (overridden by statusline)
set backspace=indent,eol,start " allow backspacing over everything in insert mode
"set textwidth=80  " lines longer than 80 columns will be broken
set colorcolumn=80
highlight ColorColumn ctermbg=235 guibg=#2c2d27
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " sets number of spaces per tab
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
set cursorline    " highlight current line
set report=0      " reports when lines are changed via ':' commands
set wildmenu      " visual autocomplete for command menu
set splitright 	  " opens vert split windows from the right
set nofoldenable  " so code isn't folded when file is opened
set clipboard=unnamed " copy/paste to and from system clipboard to default register
set incsearch     " search as characters are entered
set ignorecase    " search not case sensitive
set smartcase     " uppercase searches are case sensitive
set hlsearch      " highlight matches

set showmatch  "Highlight matching braces
set formatoptions=croq  "Enable comment line auto formatting
set title  "Set window title to file
set autochdir  "Change directory to currently open file
set wrap  "Visually wrap lines
set linebreak  "Only wrap on 'good' characters for wrapping
set ttyfast  "Speed up vim
set nostartofline "Vertical movement preserves horizontal position
set lazyredraw  "Don't redraw while running macros (faster)
" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e

nnoremap <leader><space> :nohlsearch<CR>    " turns off search highlight
inoremap tn <Esc>
inoremap nt <Esc>
" Fix annoying line-skipping behavior on long lines
nnoremap j gj
nnoremap k gk
nnoremap ; :

nnoremap <leader>e :make! <CR> :copen <CR>

" for Python files, use indent, not syntax, for folding
autocmd BufNewFile,BufRead *.py set foldmethod=indent
