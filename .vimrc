" skip initialization for vim-tiny or vim-small
if !1 | finish | endif

if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundle itself
NeoBundleFetch 'Shougo/neobundle.vim'

" plugins
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'skammer/vim-css-color'
NeoBundle 'groenewege/vim-less'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'juvenn/mustache.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'klen/python-mode'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'lepture/vim-jinja'

" themes
NeoBundle 'tomasr/molokai'

call neobundle#end()

filetype plugin indent on

" check for plugin updates
NeoBundleCheck

" disable modelines for security
set modelines=0

" theme settings
colorscheme molokai
set guifont=Menlo:h16

" syntax highlighting
syntax on

" highlight 400 columns max
set synmaxcol=400

" tabs are four spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set shiftround

" ^^ except for HTML, CSS, LESS, and JavaScript
autocmd FileType html,htmldjango,jinja,css,less,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

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

" highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" save file on loss of focus
autocmd FocusLost * :wa

" Source the vimrc file after saving it
autocmd bufwritepost .vimrc source $MYVIMRC

" leader key
let mapleader = ','

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
nmap <S-space> <leader><leader>F

" pdb shortcut
nnoremap <leader>pd oimport pdb; pdb.set_trace()<esc>

" console.log/chromelogger shortcuts
nnoremap <leader>cl oconsole.log();<left><left>
nnoremap <leader>ch oimport chromelogger as console; console.log()<left>

" amd module shortcut
nnoremap <leader>m idefine([<cr><cr>], function (<cr><cr>) {<cr><cr>});<up><up><up><up><up><tab>

" easy editing of vimrc and zshrc
nnoremap <leader>vc :sp ~/.vimrc<cr>
nnoremap <leader>zc :sp ~/.zshrc<cr>

" ack.vim
nnoremap <leader>a :Ack<space>

" ctrlp for site-packages
nnoremap <leader>g :CtrlP $VIRTUAL_ENV/lib/python2.7/site-packages/<cr>

" ctrlp
let g:ctrlp_map = '<leader>f'
" ignore certain files and directories
set wildignore+=*.pyc
set wildignore+=*/node_modules/*
set wildignore+=*/local/static/*
set wildignore+=*/locale/*
set wildignore+=*/extra/static/migration/*

" Syntastic
" toggle for active linting
nnoremap <leader>l :SyntasticToggleMode<cr>
" active mode
let g:syntastic_check_on_open=1
" cool symbols to mark errors and warnings
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_html_checkers=[]
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
" goto definition shortcut
let g:pymode_rope_goto_definition_bind = '<leader>d'

" tern
nnoremap <leader>s :TernDef<cr>
nnoremap <leader>r :TernRefs<cr>

" NERDTree
nnoremap <leader>t :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
