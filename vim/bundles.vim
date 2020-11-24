set nocompatible               " be iMproved
filetype off                   " required!

call plug#begin('~/.vim/plugged')

"------------------
" Code Completions
"------------------
"Plug 'Shougo/neocomplcache'
"Plug 'mattn/emmet-vim'
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'ycm-core/YouCompleteMe'
Plug 'ervandew/supertab'

" snippets
"Plug 'garbas/vim-snipmate'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"------ snipmate dependencies -------
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

"-----------------
" Fast navigation
"-----------------
"Plug 'edsono/vim-matchit'
"Plug 'Lokaltog/vim-easymotion'
"
"----------------
" Latex
" ---------------
Plug 'lervag/vimtex'
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

"--------------
" Fast editing
"--------------
Plug 'tpope/vim-surround'
"Plug 'scrooloose/nerdcommenter'
"Plug 'sjl/gundo.vim'
"Plug 'godlygeek/tabular'
Plug 'nathanaelkane/vim-indent-guides'

"--------------
" IDE features
"--------------
"Plug 'scrooloose/nerdtree'
"Plug 'humiaozuzu/TabBar'
"Plug 'majutsushi/tagbar'
"Plug 'mileszs/ack.vim'
"Plug 'kien/ctrlp.vim'
"Plug 'tpope/vim-fugitive'
"Plug 'Lokaltog/vim-powerline'
"Plug 'scrooloose/syntastic'
"Plug 'bronson/vim-trailing-whitespace'

"-------------
" Other Utils
"-------------
"Plug 'humiaozuzu/fcitx-status'
"Plug 'nvie/vim-togglemouse'
Plug 'luochen1990/rainbow'

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
"------- web backend ---------
"Plug '2072/PHP-Indenting-for-VIm'
"Plug 'tpope/vim-rails'
"Plug 'lepture/vim-jinja'
"Plug 'digitaltoad/vim-jade'

"------- web frontend ----------
" Plug 'othree/html5.vim'
" Plug 'tpope/vim-haml'
" Plug 'pangloss/vim-javascript'
" Plug 'kchmck/vim-coffee-script'
" Plug 'nono/jquery.vim'
" Plug 'groenewege/vim-less'
" Plug 'wavded/vim-stylus'
" Plug 'nono/vim-handlebars'

"------- markup language -------
" Plug 'tpope/vim-markdown'
" Plug 'timcharper/textile.vim'

"------- Ruby --------
" Plug 'tpope/vim-endwise'

"------- Go ----------
" Plug 'fatih/vim-go'

"------- FPs ------
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'wlangstroth/vim-racket'
" Plug 'vim-scripts/VimClojure'
" Plug 'rosstimson/scala-vim-support'

"--------------
" Color Schemes
"--------------
"Plug 'rickharris/vim-blackboard'
"Plug 'altercation/vim-colors-solarized'
" Plug 'rickharris/vim-monokai'
"Plug 'tpope/vim-vividchalk'
"Plug 'Lokaltog/vim-distinguished'
"Plug 'chriskempson/vim-tomorrow-theme'
"Plug 'fisadev/fisa-vim-colorscheme'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
filetype plugin indent on     " required!
