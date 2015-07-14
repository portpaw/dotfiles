" skip initialization for vim-tiny or vim-small
if !1 | finish | endif

if has('vim_starting')
    set nocompatible
endif

call plug#begin('~/.vim/plugged')

" plugins
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'tomtom/tcomment_vim'
Plug 'skammer/vim-css-color'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-markdown'
Plug 'juvenn/mustache.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'lepture/vim-jinja'
Plug 'mxw/vim-jsx'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'itchyny/lightline.vim'

" themes
Plug 'tomasr/molokai'

call plug#end()

filetype plugin indent on

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

set backup
set noswapfile
set undofile
set undoreload=10000

set undodir=~/.vim/tmp/undo/
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/

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

" fold based on indent
set foldmethod=indent
" deepest fold is 10 levels
set foldnestmax=10
"dont fold by default
set nofoldenable
set foldlevel=1

" status line
set laststatus=2

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
let g:ctrlp_use_caching = 0

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" ignore certain files and directories
set wildignore+=*.pyc
set wildignore+=*/node_modules/*
set wildignore+=*/local/static/*
set wildignore+=*/locale/*

" YouCompleteMe
nnoremap <leader>d :YcmCompleter GoTo<cr>

" tern
autocmd FileType javascript setlocal omnifunc=tern#Complete
nnoremap <leader>s :TernDef<cr>
nnoremap <leader>r :TernRefs<cr>

" NERDTree
nnoremap <leader>t :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
