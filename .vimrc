""""""""""""""""""""""""""""""
" Bundle settings.
""""""""""""""""""""""""""""""
" Call pathogen and manage plugin paths.
call pathogen#runtime_append_all_bundles()

""""""""""""""""""""""""""""""
" Indent section
""""""""""""""""""""""""""""""
set expandtab
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=0

""""""""""""""""""""""""""""""
" Statusline section
""""""""""""""""""""""""""""""
set laststatus=2
set statusline=\|\ %<%F%h%m%r%h%w%y\ \|\ %{&ff}\ \|\ %{strftime(\"%d/%m/%Y-%H:%M\")}%=\ branch:\ %{GitBranch()}\ \|\ col:%4c\ \|\ lin:%4l\/%4L\ \|\%4P\ \|

""""""""""""""""""""""""""""""
" Window section
""""""""""""""""""""""""""""""
set winheight=28
set winwidth=120

""""""""""""""""""""""""""""""
" Toggle settings
""""""""""""""""""""""""""""""
nnoremap si :set autoindent!<CR>:set autoindent?<CR>
nnoremap sn :set number!<CR>:set number?<CR>
nnoremap sf :set foldenable!<CR>:set foldenable?<CR>

""""""""""""""""""""""""""""""
" Moving cursor
""""""""""""""""""""""""""""""
" Paging
noremap <C-j> <C-f>
noremap <C-k> <C-b>

"""""""""""""""""""""""""""""
" Reference
"""""""""""""""""""""""""""""
" PHP manual
let g:ref_phpmanual_path = $HOME.'/.vim/doc/phpmanual'
let g:ref_jquery_path = $HOME.'/.vim/doc/jquery'

"""""""""""""""""""""""""""""
" Folding section
"""""""""""""""""""""""""""""
set foldmethod=indent
set foldcolumn=1
set foldnestmax=2
set foldlevelstart=1
set foldminlines=0

"""""""""""""""""""""""""""""
" Tab section
"""""""""""""""""""""""""""""
set showtabline=2
nnoremap <silent> tt :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <C-n> :<C-u>tabnext<CR>
nnoremap <C-p> :<C-u>tabprevious<CR>

"""""""""""""""""""""""""""""
" Git section
"""""""""""""""""""""""""""""
nnoremap <silent> gs :<C-u>Git status<CR>
nnoremap <silent> gd :<C-u>GitDiff<CR>
nnoremap <silent> gc :<C-u>Git status<CR>:GitCommit<CR>
nnoremap <silent> ga :<C-u>GitAdd -A<CR>:Git status<CR>

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

""""""""""""""""""""""""""""""
" Some useful shortcuts
""""""""""""""""""""""""""""""
" Quit
nnoremap qq :q<CR>
" Insert empty line
nnoremap O :<C-u>call append(expand('.'), '')<CR>j
" Quick run
nnoremap <silent> qr :<C-u>QuickRun<CR>

""""""""""""""""""""""""""""""
" Automate editing
""""""""""""""""""""""""""""""
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
