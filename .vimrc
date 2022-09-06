" skip initialization for vim-tiny or vim-small
if !1 | finish | endif

if has('vim_starting')
    set nocompatible
endif

call plug#begin('~/.vim/plugged')

" plugins
Plug 'ctrlpvim/ctrlp.vim'
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
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'mxw/vim-jsx'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'mtscout6/syntastic-local-eslint.vim'

" themes
Plug 'tomasr/molokai'

call plug#end()

filetype plugin indent on

" disable modelines for security
set modelines=0

" theme settings
colorscheme molokai
set guifont=Source\ Code\ Pro\ for\ Powerline:h18

" syntax highlighting
syntax on

" highlight 400 columns max
set synmaxcol=400

" tabs are two spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set shiftround

" trim trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line('.')
    let c = col('.')
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType html,css,less,javascript,json autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

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
inoremap jk <esc>

" EasyMotion
" search forwards
nmap <space> <leader><leader>f
" search backwards
nmap <S-space> <leader><leader>F

" easy editing of vimrc and zshrc
nnoremap <leader>vc :sp ~/.vimrc<cr>
nnoremap <leader>zc :sp ~/.zshrc<cr>

" ack.vim
nnoremap <leader>a :Ack<space>

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
set wildignore+=*/node_modules/*

" YouCompleteMe
nnoremap <leader>d :YcmCompleter GoTo<cr>

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

" fzf
set rtp+=/usr/local/opt/fzf
