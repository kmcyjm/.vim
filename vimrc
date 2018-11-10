" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Gerhard Gappmeier
"
" set working directory at startup
cd ~/Dropbox/WorkSpace/c

" spell check off
autocmd VimEnter * set nospell

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
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
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
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Enhanced keyboard mappings
"
" in normal mode F3 will save the file
inoremap <F3> <Esc>:w<CR>
" use F5, F6 to navigate between tabs
nnoremap <F5> :tabp<CR>
nnoremap <F6> :tabn<CR>
inoremap <F5> :tabp<CR>
inoremap <F6> :tabn<CR>
