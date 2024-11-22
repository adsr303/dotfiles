source $VIMRUNTIME/defaults.vim

if has("gui_running")
  " https://github.com/fatih/molokai
  colorscheme molokai
  set guifont=JetBrains\ Mono\ 12
  " Get more screen real estate
  set guioptions-=T
endif

set expandtab
set shiftwidth=4
set softtabstop=4

" Stolen from nano :)
nmap <A-Left>  :bprev<CR>
nmap <A-Right> :bnext<CR>

" https://github.com/fatih/vim-go
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4

" https://github.com/fatih/vim-go/wiki/Tutorial
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>l <Plug>(go-lint)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

let g:go_fmt_command = "goimports"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1

" Errors list
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <Leader>a :cclose<CR>

" Other
autocmd FileType bash,sh setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType vim setlocal expandtab shiftwidth=2 softtabstop=2
