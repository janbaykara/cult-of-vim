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

imap <C-Return> <CR><CR><C-o>k<Tab>

set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

" /-------------
" | Display
" \---

"  Colourscheme
syntax enable
set background=dark
colorscheme solarized

" Lines
set number
