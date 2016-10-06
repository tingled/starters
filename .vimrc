set nocompatible
set term=xterm-color
set viminfo^=!
syntax on
filetype plugin indent on
set tabstop=4
set ruler
set shiftwidth=4
set backspace=indent,eol,start
set autoindent
set et
set softtabstop=4
set smarttab
set expandtab
set term=xterm-color
set background=dark
colorscheme Mustang
highlight Normal ctermbg=None
highlight nonText ctermbg=None
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
let mapleader=","

:nnoremap <F8> :setl noai nocin nosi inde=<CR>

