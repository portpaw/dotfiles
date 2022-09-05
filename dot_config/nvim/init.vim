" disable vi compatibility
set nocompatible

" show matching braces
set showmatch

" case-insensitive searching
set ignorecase

" incremental searching
set incsearch               

" highlight search results
set hlsearch                 

" tabs are actual tab characters that appear as 2 spaces
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0

" automatically indent new lines
set autoindent

" auto-indenting based on file type
filetype plugin indent on

" show line numbers
set number

" menu auto-completion
set wildmenu
set wildmode=longest:list,full

" 80-column border
set cc=80

" syntax highlighting
syntax on

" enable mouse support
set mouse=a

" use system clipboard
set clipboard=unnamedplus

" enable filetype-specific plugins
filetype plugin on

" highlight current line
set cursorline

" faster scrolling
set ttyfast

" centralize temp directories
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
