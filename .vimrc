""""""""""""""""""""""""""""""
" Bundle settings.
""""""""""""""""""""""""""""""
" Call pathogen and manage plugin paths.
call pathogen#runtime_append_all_bundles()
" vim-ref
let g:ref_phpmanual_path = $HOME.'/.vim/doc/phpmanual'

""""""""""""""""""""""""""""""
" Basic settings.
""""""""""""""""""""""""""""""
" Change tab spaces when type the tab key.
set expandtab
" Change displaying tab spaces 2 spaces.
set tabstop=2
" Change insert spaces when type the tab key 2 spaces.
set shiftwidth=2
" If this sets 0, vim will insert same number of spaces as shiftwidth setting value.
set softtabstop=0
" Auto indenting.
set autoindent
" Display statusline.
set laststatus=2
set statusline=\|\ %<%F%h%m%r%h%w%y\ \|\ %{&ff}\ \|\ %{strftime(\"%d/%m/%Y-%H:%M\")}%=\ branch:\ %{GitBranch()}\ \|\ col:%4c\ \|\ lin:%4l\/%4L\ \|\%4P\ \|
" Trim space of end line.
function! RTrim()
  let s:cursor = getpos(".")
  %s/\s\+$//e
  call setpos(".", s:cursor)
endfunction
autocmd BufWritePre * call RTrim()
