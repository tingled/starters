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
Plugin 'junegunn/fzf.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/AutoComplPop'
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

 "fzf
set rtp+=~/.fzf
nmap <Leader>b :Buffers<CR>
nmap <Leader>f :Files<CR>

" ruby
autocmd Filetype ruby set softtabstop=2
autocmd Filetype ruby set sw=2
autocmd Filetype ruby set ts=2

"json
autocmd FileType json set foldmethod=indent
autocmd Filetype javascript set softtabstop=2 sw=2 ts=2

"syntastic
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'eslint'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0

" ctags
augroup CTags
    autocmd!
    autocmd BufWritePost * silent !ctags-gen 2> /dev/null
augroup END
set tags=.tags;/
inoremap <expr> <TAB> pumvisible() ? '<CR>' : "\<TAB>"
