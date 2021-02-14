filetype off

call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
"./install.py --clangd-competer --rust-completer
Plug 'ycm-core/YouCompleteMe'

Plug 'rust-lang/rust.vim'

Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'

Plug 'kaicataldo/material.vim', { 'branch': 'main' }

call plug#end()
filetype plugin indent on
