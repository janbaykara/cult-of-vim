"
" Auto-install NeoBundle
"
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

" .... plugins, such as ....
NeoBundle "tpope/vim-unimpaired"
NeoBundle "tpope/vim-surround"
NeoBundle "tpope/vim-fugitive"
NeoBundle "bling/vim-airline"
NeoBundle "tpope/vim-haml"
NeoBundle "kien/ctrlp.vim"
NeoBundle "scrooloose/nerdtree"
NeoBundle "pangloss/vim-javascript"
NeoBundle "altercation/vim-colors-solarized"

NeoBundleCheck
filetype plugin indent on
syntax on

imap <C-Return> <CR><CR><C-o>k<Tab>
