 vim:fdm=marker

set nocompatible

" /=====================
" | Vanilla settings
" |-------------- 
" | A mishmash that needs sorting
" \--- {{{

" Fuck-knows...
set hidden
set expandtab
set shortmess+=A
set backspace=indent,eol,start  "Allow backspace in insert mode
filetype plugin on

" Program
set history=1000
set backupdir=#/.vimbackup,~/.vim-tmp,~/tmp,/var/tmp,$HOME/Local\ Settings/Temp

" Input
imap <C-Return> <CR><CR><C-o>k<Tab>
set backspace=indent,eol,start

" Text formatting
filetype indent on
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set fileformats=unix,dos
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp1250,iso-8859-1
" Takes care of highlight
filetype plugin on
syntax on
" Takes care of indentation
filetype indent on

" Visual only
set number            " show line numbers
syntax on
set scrolloff=12
set guifont=Source\ Code\ Pro:h14
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
set cursorline

" }}}
" /=====================
" | PLUGINS
" |--------------
" | NeoBundle
" \--- {{{

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

" /-------------- }}}
" | Installed plugins
" \--- {{{

" Universal
NeoBundle "tpope/vim-unimpaired"
NeoBundle "Townk/vim-autoclose"
NeoBundle "tpope/vim-surround"
NeoBundle "tpope/vim-fugitive"
NeoBundle "bling/vim-airline"
NeoBundle "editorconfig/editorconfig-vim"
NeoBundle "terryma/vim-multiple-cursors"
NeoBundle "Shougo/neocomplcache.vim"
NeoBundle "scrooloose/nerdtree"
NeoBundle "Yggdroot/indentLine"
NeoBundle "morhetz/gruvbox"
NeoBundle "kien/ctrlp.vim"

" Filetype-specific
NeoBundleLazy "tpope/vim-haml"
NeoBundleLazy "pangloss/vim-javascript"
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy "cakebaker/scss-syntax.vim"

NeoBundleCheck
filetype plugin indent on
syntax on
" /-------------- }}}
" | Autorun
" \--- {{{

autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
" autocmd VimEnter * wincmd w

" /-------------- }}}
" | Plugin config
" \--- {{{

let NERDTreeShowHidden=1

" Autocomplete via NeoComplCache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1

autocmd FileType scss,sass,css setlocal omnifunc=csscomplete#CompleteCSS
autocmd Bufenter *.scss,*.sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,php,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" /---------- }}}
" | Colourscheme
" \--- {{{

" Problem with colours? Add this to ~/.profile
" ~/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh
set background=dark
colorscheme gruvbox

" }}}
" /=====================
" | KEYMAPPING
" |--------------
" | Config editing via \ev and \sv
" \--- {{{

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" /-------------- }}}
" | Autocomplete via NeoComplCache
" \--- {{{

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


