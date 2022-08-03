set nocompatible

" Vundle setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
"Plugin 'vim-python/python-syntax'
Plugin 'itchyny/lightline.vim'
Plugin 'nvie/vim-flake8'
"Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/fzf.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'davidhalter/jedi-vim'
"Plugin 'elixir-editors/vim-elixir'
"Plugin 'rust-lang/rust.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'yuezk/vim-js'
Plugin 'maxmellon/vim-jsx-pretty'
"Plugin 'jiangmiao/auto-pairs'

call vundle#end()            " required
filetype plugin indent on    " required

let mapleader=","

" golang
let g:go_fmt_command = "goimports"
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
highlight extrawhitespace ctermbg=red
match extrawhitespace /\s\+$/

" yaml formatting
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2

" javascript
autocmd FileType js,javascript setlocal ts=2 sts=2 sw=2

 "fzf
set rtp+=~/.fzf
nmap <Leader>b :Buffers<CR>
nmap <Leader>f :Files<CR>

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
"let g:syntastic_reuse_loc_lists = 0
highlight Visual ctermbg=116 ctermfg=19
highlight Search ctermbg=116 ctermfg=19
highlight SpellCap ctermbg=116 ctermfg=19
highlight SpellBad ctermbg=116 ctermfg=19

" ctags
"augroup CTags
    "autocmd!
    "autocmd BufWritePost * silent !ctags-gen 2> /dev/null
"augroup END
"set tags=.tags;/
"inoremap <expr> <TAB> pumvisible() ? '<CR>' : '\<TAB>'

set foldmethod=syntax
set nofoldenable

" treat .jams as .json
autocmd BufNewFile,BufRead *.jams set syntax=json

" rust
if executable('rust-analyzer')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rust analyzer',
        \ 'cmd': {server_info->['rust-analyzer']},
        \ 'whitelist': ['rust'],
        \ })
endif
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    "inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    "inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')

" for asyncomplete.vim log
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

set signcolumn=no
