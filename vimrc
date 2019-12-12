" VIM Configuration File
" Description: VIM config mainly for C/C++ development
" Author: Jiaming Yi

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugins')

" Declare the list of plugins.
Plug 'vim-scripts/c.vim'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'tenable/vim-nasl'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/taglist.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" autoload plugins for targeted file type
filetype plugin on

" ignorecase when search, but when uppercase is detected, switch to case sensitive search
set ignorecase
set smartcase

" set status line always on
set laststatus=2

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" set working directory at startup
" cd ~/Dropbox/

" open NERDTree when VIM starts
" autocmd vimenter * NERDTree

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" spell check off
" autocmd VimEnter * set nospell

" set file encoding
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" change to file's directory when opening files
set autochdir

" turn off beep
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility (emulation of old bugs)
set nocompatible

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=2        " tab width is 2 spaces
set shiftwidth=2     " indent also with 2 spaces
set expandtab        " expand tabs to spaces

" wrap lines at 120 chars. 80 is somewhat antiquated with nowadays displays.
set textwidth=120

" turn syntax highlighting on
set t_Co=256
syntax on

" set colorscheme
colorscheme murphy

" turn line numbers on
set number

" highlight matching braces
set showmatch

" highlight all matches
set hlsearch

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Enhanced keyboard mappings
"
" F2 save and exit the file
inoremap <F2> <Esc>:wq<CR>
nnoremap <F2> <Esc>:wq<CR>

" F3 save the file
inoremap <F3> <Esc>:w<CR>
nnoremap <F3> <Esc>:w<CR>

" F4 copy current file path to system clipboard
nnoremap <F4> :let @+ = expand("%:p")<CR>

" use F5, F6 to navigate between tabs
nnoremap <F5> :tabp<CR>
nnoremap <F6> :tabn<CR>
inoremap <F5> :tabp<CR>
inoremap <F6> :tabn<CR>

" open NERDTree window
nnoremap <F12> :NERDTreeToggle<CR>

" display full path of the current buffer
nnoremap <F10> :echo expand('%:p')<CR>
inoremap <F10> :echo expand('%:p')<CR>

" use Ag to search
let g:ackprg = 'ag --nogroup --nocolor --column'
