set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'VundleVim/Vundle.vim'

Bundle 'c9s/moose-syntax.vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'davidbeckingsale/writegood.vim'
Bundle 'fatih/vim-go'
Bundle 'junegunn/goyo.vim'
Bundle 'junegunn/limelight.vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'Reikim/mdwa.vim'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'vim-perl/vim-perl'
Bundle 'whatyouhide/vim-gotham'
Bundle 'xolox/vim-misc'
Bundle 'vimwiki/vimwiki'
Bundle 'junegunn/fzf'
Bundle 'junegunn/fzf.vim'
Bundle 'michal-h21/vim-zettel'

call vundle#end()

if executable('ag')
    let g:ackprg = 'ag'
endif

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
let perl_sub_signatures = 1

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

let g:limelight_conceal_ctermfg = 240

function! s:goyo_enter()
    if exists('$TMUX')
        silent !tmux set status off
    endif
    Limelight
endfunction

function! s:goyo_leave()
    if exists('$TMUX')
        silent !tmux set status on
    endif
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nmap <leader>g :Goyo<CR>

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"

" vimwiki/vimwiki
let g:vimwiki_list = [
    \{'path': '~/dev/commonplacebook', 'syntax': 'markdown', 'ext': '.md'},
\]

"augroup commonplacebook
"au! BufReadPre  ~/dev/commonplacebook/* silent! !git pull > /dev/null
"au! BufWritePost ~/dev/commonplacebook/* silent! !git add .;git commit -m "Auto commit of %:t." "%" > /dev/null; git push &> /dev/null&
"augroup END

" Filename format. The filename is created using strftime() function
let g:zettel_format = "%Y%m%d-%H%M"
" command used for VimwikiSearch
" default value is "ag". To use other command, like ripgrep, pass the
" command line and options:
" let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "

" Set template and custom header variable for the second Wiki
let g:zettel_options = [{"template" :  "~/dev/commonplacebook/.zettle/note.tmpl"}]

