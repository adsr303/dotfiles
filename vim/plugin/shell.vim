" shell.vim - Format and lint shell scripts
" Author: Artur de Sousa Rocha
" Description: Integrates shfmt and two linters for better shell script editing.

if exists("g:loaded_shell_plugin")
  finish
endif
let g:loaded_shell_plugin = 1

" ---------------------------
" Configuration (optional)
" ---------------------------
if !exists("g:shell_autoformat")
  let g:shell_autoformat = 1
endif

if !exists("g:shell_shfmt_options")
  let g:shell_shfmt_options = '-i 2 -ci -sr -bn'
endif

if !exists("g:shell_autolint")
  let g:shell_autolint = 1
endif

" ---------------------------
" Auto Commands
" ---------------------------
augroup ShellTools
  autocmd!
  autocmd FileType sh,bash call s:SetupShellTools()
  autocmd BufWritePre *.sh if g:shell_autoformat | call s:ShFmt() | endif
  autocmd BufWritePre * if &filetype ==# 'sh' || &filetype ==# 'bash'
        \ && g:shell_autoformat | call s:ShFmt() | endif
  autocmd BufWritePost * if &filetype ==# 'sh' || &filetype ==# 'bash'
        \ && g:shell_autolint | call s:ShLint() | endif
augroup END

" ---------------------------
" Commands
" ---------------------------
command! ShLint call s:ShLint()
command! ShFmt call s:ShFmt()

" ---------------------------
" ShellTools Setup
" ---------------------------
function! s:SetupShellTools() abort
  " Integrate shfmt with the = key
  if executable('shfmt')
    let &l:equalprg = 'shfmt ' . g:shell_shfmt_options
  endif
endfunction

" ---------------------------
" Formatter
" ---------------------------
function! s:ShFmt() abort
  if !executable("shfmt")
    echohl WarningMsg | echo "shfmt not found in PATH" | echohl None
    return
  endif

  let l:view = winsaveview()
  silent execute '%!shfmt ' . g:shell_shfmt_options
  call winrestview(l:view)
endfunction

" ---------------------------
" Linters
" ---------------------------
function! s:ShLint() abort
  if empty(expand('%:p')) || &modified
    echohl WarningMsg | echo "Save file before linting" | echohl None
    return
  endif

  let l:filename = shellescape(expand('%:p'))

  if !executable('shellcheck')
    echohl WarningMsg | echo "shellcheck not found" | echohl None
    return
  endif

  if !executable('checkbashisms')
    echohl WarningMsg | echo "checkbashisms not found" | echohl None
    return
  endif

  let l:cmd = 'shellcheck -f gcc ' . l:filename . '; checkbashisms -l ' . l:filename
  cexpr system(l:cmd)
  cwindow
endfunction

