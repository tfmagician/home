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
set foldminlines=3
" Windows settings
set winheight=28
set winwidth=120
" Tab settings
set showtabline=2
nnoremap <silent> tc :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <silent> tk :<C-u>tabclose<CR>
nnoremap <silent> tn :<C-u>tabnext<CR>
nnoremap <silent> tp :<C-u>tabprevious<CR>
nnoremap <C-n> :<C-u>tabnext<CR>
nnoremap <C-p> :<C-u>tabprevious<CR>
" Paging settings
noremap <C-j> <C-f>
noremap <C-k> <C-b>
" Insert empty line
nnoremap O :<C-u>call append(expand('.'), '')<CR>j
" Toggle settings
nnoremap si :set autoindent!<CR>:set autoindent?<CR>
nnoremap sn :set number!<CR>:set number?<CR>
nnoremap sf :set foldenable!<CR>:set foldenable?<CR>
" Editing shortcuts
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
" Quick run
nnoremap <silent> qr :<C-u>QuickRun<CR>
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
