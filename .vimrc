" /=====================
" | PLUGINS
" |--------------
" | NeoBundle
" \---

filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  if !isdirectory(expand('~/.vim/bundle/neobundle.vim'))
    echo "Installing NeoBundle\n"
    silent execute '!mkdir -p ~/.vim/bundle'
    silent execute '!git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim'
  endif
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch "Shougo/neobundle.vim"

" /--------------
" | Installed plugins
" \---

NeoBundle "altercation/vim-colors-solarized"
NeoBundle "pangloss/vim-javascript"
NeoBundle "tpope/vim-unimpaired"
NeoBundle "Townk/vim-autoclose"
NeoBundle "tpope/vim-surround"
NeoBundle "tpope/vim-fugitive"
NeoBundle "bling/vim-airline"
NeoBundle "tpope/vim-haml"
NeoBundle "editorconfig/editorconfig-vim"
NeoBundle "terryma/vim-multiple-cursors"
NeoBundle "Shougo/neocomplcache.vim"
NeoBundle "scrooloose/nerdtree"
NeoBundle "Yggdroot/indentLine"
NeoBundle "kien/ctrlp.vim"

NeoBundleCheck
filetype plugin indent on
syntax on

" /--------------
" | Autorun
" \---

autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
" autocmd VimEnter * wincmd w


" /=====================
" | KEYMAPPING
" |--------------
" | Config editing via \ev and \sv
" \---

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Autocomplet via NeoComplCache
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" /=====================
" | SETTINGS
" |--------------
" | File handling
" \---

" Ignore .swp warnings
set shortmess+=A
set backupdir=#/.vimbackup,~/.vim-tmp,~/tmp,/var/tmp,$HOME/Local\ Settings/Temp

" Plugin filehandling
let NERDTreeShowHidden=1

" /--------------
" | Syntax
" \---

" Autocomplete via NeoComplCache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1

autocmd FileType scss,sass,css setlocal omnifunc=csscomplete#CompleteCSS
autocmd Bufenter *.scss,*.sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,php,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Tabs
imap <C-Return> <CR><CR><C-o>k<Tab>
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

" /-------------
" | Display
" \---

" Type
set guifont=Source\ Code\ Pro:h14

" Colourscheme
syntax enable
set background=dark
colorscheme solarized

" Lines
set number

" Indent lines
set list lcs=tab:\|\
