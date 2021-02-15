set nocompatible
set fileencodings=utf-8,gb2312,gb18030,gbk

source ~/.vim/bundles.vim

"----------------- Theme -------------------
syntax on
syntax enable
if has('termguicolors')
    set termguicolors
endif
let g:material_theme_style='ocean-community'
colorscheme material
"-------------------------------------------

au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline
let loaded_matchparen=1

set incsearch
set ignorecase
set smartcase

set nobackup
set noundofile
set noswapfile
set nocompatible
set nofoldenable
set belloff=all
set confirm

set backspace=indent,eol,start
set t_Co=256
set mouse=a
set report=0
set nowrap
set scrolloff=5
set number
set showcmd
set title
set laststatus=2

set clipboard=unnamed

set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

if has('gui_running')
    set go=aAce
    set showtabline=2
    set columns=140
    set lines=40
endif

"---------- Key Map -----------
let mapleader="<space>"
imap jj <Esc>
nmap <leader>d dd
"------------------------------

"--------- tab switch ---------
map <M-t> :tabnew 
map <M-0> :tablast<CR>
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt
map <M-6> 6gt
map <M-7> 7gt
map <M-8> 8gt
map <M-9> 9gt
"------------------------------

"-------- typo command --------
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa
"------------------------------

"-------- YouCompleteMe ----------
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
set completeopt=menu,menuone

let g:ycm_semantic_triggers =  {
    \ 'c,cpp,python,rust,sh': ['re!\w{2}'],
\ }
let g:ycm_filetype_whitelist = { 
    \ "c": 1,
    \ "cpp": 1,
    \ "python": 1,
    \ "rust": 1,
    \ "sh": 1
\ }
" your cland path
let g:ycm_clangd_binary_path = '/usr/local/opt/llvm/bin/clangd'
"---------------------------------

"----------- Commentary ----------
autocmd FileType python,shell set commentstring=#\ %s
autocmd FileType java,c,cpp,rust set commentstring=//\ %s
autocmd FileType vim set commentstring=\"\ %s
"---------------------------------

"------------ Rainbow ------------
let g:rainbow_active=1
"---------------------------------

"------------ map <Meta> key to Option in macOS --------
"Need to set Left (or Right) Option Key as Esc+ in iTerm.app's profile
function! Terminal_MetaMode(mode)
    set ttimeout
    if $TMUX != ''
        set ttimeoutlen=30
    elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
        set ttimeoutlen=80
    endif
    if has('nvim') || has('gui_running')
        return
    endif
    function! s:metacode(mode, key)
        if a:mode == 0
            exec "set <M-".a:key.">=\e".a:key
        else
            exec "set <M-".a:key.">=\e]{0}".a:key."~"
        endif
    endfunc
    for i in range(10)
        call s:metacode(a:mode, nr2char(char2nr('0') + i))
    endfor
    for i in range(26)
        call s:metacode(a:mode, nr2char(char2nr('a') + i))
        call s:metacode(a:mode, nr2char(char2nr('A') + i))
    endfor
    if a:mode != 0
        for c in [',', '.', '/', ';', '[', ']', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    else
        for c in [',', '.', '/', ';', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    endif
endfunc

call Terminal_MetaMode(0)
"command! -nargs=0 -bang VimMetaInit call Terminal_MetaMode(<bang>0)
"-------------------------------------------------------
