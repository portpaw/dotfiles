set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Plugins
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'msanders/snipmate.vim'
Bundle 'mileszs/ack.vim'
Bundle 'skammer/vim-css-color'
Bundle 'mattn/zencoding-vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'pangloss/vim-javascript'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-markdown'
Bundle 'juvenn/mustache.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'

" Themes
Bundle 'tomasr/molokai'

filetype plugin indent on

" disable modelines for security
set modelines=0

" Theme settings
colorscheme molokai
set guifont=Menlo:h12

" syntax highlighting
syntax on

" tabs are four spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set shiftround

" ^^ except for HTML, CSS, LESS, and JavaScript
autocmd FileType html,htmldjango,css,less,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab smarttab shiftround

" utf-8 by default, obvs
set encoding=utf-8

" give at least three lines of context at all times
set scrolloff=3

" show line and column on status bar
set ruler

" show line numbers in gutter
set number

" auto-indent, but be smart about it
set autoindent
set copyindent

" highlight current line
set cursorline

" tell me when I'm in insert or visual mode
set showmode

" this is the 21st century; we have a fast terminal
set ttyfast

" stop bugging me
set visualbell
set noerrorbells

" backspace is stupid
set backspace=indent,eol,start

" hide buffers instead of closing them
set hidden

" backup files are so last century
set nobackup
set noswapfile

" lots of history
set history=1000
set undolevels=1000

" leader key
let mapleader = ","

" ; is easier to type than :
nnoremap ; :

" easy way back to normal mode
inoremap jj <ESC>

" help keys are annoying
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" all characters except for a-zA-Z0-9_ have a special meaning when searching
nnoremap / /\v
vnoremap / /\v

" case-insensitive search, unless you include a capital letter
set ignorecase
set smartcase

" search/replace globally by default
set gdefault

" incremental search
set incsearch

" highlight search terms and give a quick shortcut to clear highlighting
" set hlsearch
" nnoremap <leader><space> :noh<cr>

" highlight matching bracket
set showmatch

" highlight column 80
set colorcolumn=80

" show tab and EOL characters
set list
set listchars=tab:▸\ ,eol:¬

" save file on loss of focus
autocmd FocusLost * :wa

" easy editing of vimrc
nnoremap <leader>vc :sp ~/.vimrc<cr>

" ack.vim
nnoremap <leader>a :Ack<space>

" fugitive
nnoremap <leader>s :Gstatus<cr>

" ctrlp
let g:ctrlp_map = '<leader>f'
" ctrlp for site-packages
nnoremap <leader>g :CtrlP $VIRTUAL_ENV/lib/python2.7/site-packages/<cr>
" ignore certain files and directories
set wildignore+=*.pyc
set wildignore+=*/node_modules/*
set wildignore+=*/local/static/*

" Syntastic
" active mode
let g:syntastic_check_on_open=1
" cool symbols to mark errors and warnings
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
" better line highlighting for errors
highlight SyntasticErrorLine guibg=#5c0b09

" EasyMotion
" search forwards
nmap <space> <leader><leader>f
" search backwards
nmap <C-space> <leader><leader>F

