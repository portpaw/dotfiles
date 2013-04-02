set nocompatible
" prevent a non-zero exit code by turning filetype on before turning it off
filetype on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Plugins
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'mattn/zencoding-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'msanders/snipmate.vim'
Bundle 'mileszs/ack.vim'
Bundle 'skammer/vim-css-color'
Bundle 'tomtom/tcomment_vim'
Bundle 'pangloss/vim-javascript'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-markdown'
Bundle 'juvenn/mustache.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'majutsushi/tagbar'
Bundle 'klen/python-mode'
Bundle 'ervandew/supertab'

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

" trim trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line('.')
    let c = col('.')
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType python,html,htmldjango,css,less,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" show dir listing when opening file
set wildmenu
set wildmode=list:longest

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

" tell me things about the command I'm using
set showcmd

" this is the 21st century; we have a fast terminal
set ttyfast

" stop bugging me
set visualbell
set noerrorbells

" backspace is stupid
set backspace=indent,eol,start

" hide buffers instead of closing them
set hidden

" don't back up to the pwd
set backupdir=/tmp
set directory=/tmp

" ^^ except for undo history files
set undofile

" lots of history
set history=1000
set undolevels=1000

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

" Source the vimrc file after saving it
autocmd bufwritepost .vimrc source $MYVIMRC

" help keys are annoying
inoremap <F1> <esc>
nnoremap <F1> <esc>
vnoremap <F1> <esc>

" easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ; is easier to type than :
nnoremap ; :

" easy way back to normal mode
inoremap jj <esc>

" EasyMotion
" search forwards
nmap <space> <leader><leader>f
" search backwards
nmap <C-space> <leader><leader>F

" leader key
let mapleader = ','

" easy editing of vimrc
nnoremap <leader>vc :sp ~/.vimrc<cr>

" ack.vim
nnoremap <leader>a :Ack<space>

" fugitive
nnoremap <leader>s :Gstatus<cr>

" rope
nnoremap <leader>d :RopeGotoDefinition<cr>

" tagbar
nnoremap <leader>t :TagbarToggle<cr>

" ctrlp for site-packages
nnoremap <leader>g :CtrlP $VIRTUAL_ENV/lib/python2.7/site-packages/<cr>
" ctrlp
let g:ctrlp_map = '<leader>f'
" ignore certain files and directories
set wildignore+=*.pyc
set wildignore+=*/node_modules/*
set wildignore+=*/local/static/*

" Syntastic
" toggle for active linting
nnoremap <leader>l :SyntasticToggleMode<cr>
" active mode
let g:syntastic_check_on_open=1
" cool symbols to mark errors and warnings
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
" better line highlighting for errors
highlight SyntasticErrorLine guibg=#5c0b09

" python-mode
" turn off code folding
let g:pymode_folding=0
" for fast machines
let g:pymode_syntax_slow_sync=0
" don't let rope recursively search dirs for .ropeproject
let g:pymode_rope_guess_project=0
" add projects dir to python path
let g:pymode_paths=['~/Projects']

