function! myspacevim#before() abort
  let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style=Google']
    \ }
  let g:neoformat_enabled_cpp = ['clangformat']
  let g:mapleader = ','
endfunction

function! myspacevim#after() abort
endfunction
