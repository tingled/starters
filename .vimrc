set nocompatible

" Vundle setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-python/python-syntax'
Plugin 'nvie/vim-flake8'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader=","

" golang
let g:go_fmt_command = "goimports"
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_list_type = "quickfix"

set viminfo^=!
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4

"set ruler
set backspace=indent,eol,start
set autoindent
set smarttab
set expandtab
highlight Normal ctermbg=None
highlight nonText ctermbg=None
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/

set rtp+=~/.fzf
nmap <Leader>b :Buffers<CR>
nmap <Leader>f :Files<CR>
