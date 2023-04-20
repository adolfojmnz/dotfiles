"" nvim envs for python support
let g:python3_host_prog = '/home/adolfoj/venvs/py3nvim/bin/python'
let g:loaded_python_provider = 0

" python settings
set smarttab
set tabstop=4
set autoindent
set smartindent
set shiftwidth=4
set backspace=indent,eol,start

" init embbeded terminal in insert mode
if has('nvim')
    autocmd TermOpen term://* startinsert
endif

" Python maps
autocmd FileType python noremap  <buffer> <F11> 	 :w<CR>:exec 'split term://python3 %' shellescape(@%, 1)<CR>
autocmd FileType python inoremap <buffer> <F11> <esc>:w<CR>:exec 'split term://python3 %' shellescape(@%, 1)<CR>
autocmd FileType python noremap  <buffer> <F12> 	 :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python inoremap <buffer> <F12> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

