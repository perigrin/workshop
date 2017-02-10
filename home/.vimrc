set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'c9s/moose-syntax.vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'davidbeckingsale/writegood.vim'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'vim-perl/vim-perl'
Bundle 'xolox/vim-misc'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'junegunn/goyo.vim'
Bundle 'whatyouhide/vim-gotham'

filetype plugin indent on
syntax on

set autowrite
set autoread

set termencoding=utf-8
set encoding=utf-8

set nojoinspaces
set nostartofline

set nofoldenable
set paste
set showcmd
set ignorecase
set smartcase

set ruler
set number
set showmode
set showcmd
set display+=lastline,uhex

set sw=4
set ts=4
set sts=4
set smarttab
set expandtab
set shiftround
set autoindent
set smartindent

xnoremap < <gv
xnoremap > >gv

color gotham256

" enable persistent undo
if has("persistent_undo")
    set undofile
    set undodir=~/.vim/data/undo
endif

set ttyfast
set noswapfile

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

let perl_extended_vars=1
let perl_include_pod=1
let perl_string_as_statement=1
let perl_sync_dist=1000

au BufNewFile,BufRead *.tt setf tt2html
au BufNewFile,BufRead *.tt2 setf tt2html

" stolen from hoelzro's autocommands file
autocmd VimResized * exe "normal! \<c-w>="

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Private gists by default
let g:gist_post_private = 1
" And we do a lot of multi-file gists
let g:gist_get_multiplefile = 1

