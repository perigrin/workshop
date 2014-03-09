set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'c9s/moose-syntax.vim'
Bundle 'jgdavey/tslime.vim'
Bundle 'jnwhiteh/vim-golang'
Bundle 'kchmck/vim-coffee-script'
Bundle 'dmitry-ilyashevich/vim-typescript'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'vim-perl/vim-perl'
Bundle 'vim-scripts/Colour-Sampler-Pack'
Bundle 'vimwiki/vimwiki'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-misc'

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

set t_Co=256
set background=dark
color solarized

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

" set up texmate bindings for NERDCommenter
map <C-l> <Plug>NERDCommenterToggle
map <F2> :NERDTreeToggle<CR>
map <F3> <Plug>SetTmuxVars

"define :Tidy command to run perltidy on visual selection || entire buffer"
command -range=% -nargs=* Tidy <line1>,<line2>!perltidy

"run :Tidy on entire buffer and return cursor to (approximate) original position"
fun DoTidy()
    let Pos = line2byte( line( "." ) ) 
    :Tidy
    exe "goto " . Pos 
endfun

"shortcut for normal mode to run on entire buffer then return to current line"
"au Filetype perl nmap <C-H> :call DoTidy()<CR>

"shortcut for visual mode to run on the the current visual selection"
"au Filetype perl vmap <C-H> :Tidy<CR>

let perl_extended_vars=1
let perl_include_pod=1
let perl_string_as_statement=1
let perl_sync_dist=1000

au BufNewFile,BufRead *.tt setf tt2html
au BufNewFile,BufRead *.tt2 setf tt2html
