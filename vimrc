" VIM Configuration File
" Description: VIM config mainly for C/C++ development
" Author: Jiaming Yi

" Automatic installation plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugins')

" Declare the list of plugins.
Plug 'vim-scripts/c.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdcommenter'
"Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tenable/vim-nasl'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

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

" clear last search highlight
nnoremap <esc> :noh<return><esc>

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

" F4 enable/disable line number
nnoremap <F4> :set invnumber<CR>

" F5 to create fold, F6/F7 to open/close fold
nnoremap <F5> zfa{
nnoremap <F6> zo
nnoremap <F7> zc

" open NERDTree window
nnoremap <F12> :NERDTreeToggle<CR>
