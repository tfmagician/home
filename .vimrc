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
set tabstop=4
" Change insert spaces when type the tab key 2 spaces.
set shiftwidth=4
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
" Save last position.
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" Enable hoding
set foldmethod=indent
set foldcolumn=1
set foldnestmax=2
set foldlevelstart=1
" Windows settings
set winheight=28
set winwidth=120

""""""""""""""""""""""""""""""
" Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def
