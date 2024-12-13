unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" In case of using https://github.com/Alligator/accent.vim
let g:accent_colour = 'blue'
let g:accent_no_bg = 1

if has("gui_running")
  set guifont=JetBrains\ Mono\ 12
  " Get more screen real estate
  set guioptions-=T
endif
colorscheme lunaperche

set expandtab
set shiftwidth=4
set softtabstop=4

" Stolen from nano :)
nmap <A-Left>  :bprev<CR>
nmap <A-Right> :bnext<CR>

" https://github.com/fatih/vim-go/wiki/Tutorial
autocmd FileType go,gomod,godoc setlocal noexpandtab shiftwidth=4 tabstop=4

autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>d <Plug>(go-doc)
autocmd FileType go nmap <Leader>e <Plug>(go-alternate-edit)
autocmd FileType go nmap <Leader>l <Plug>(go-lint)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_highlight_operators = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" Errors list
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <Leader>a :cclose<CR>

" Other
autocmd FileType bash,sh setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType vim setlocal expandtab shiftwidth=2 softtabstop=2
