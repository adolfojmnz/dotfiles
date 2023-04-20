" JavaScript
autocmd FileType javascript noremap  <buffer> <F11> 	 :w<CR>:exec 'split term://node %' shellescape(@%, 1)<CR>
autocmd FileType javascript inoremap <buffer> <F11> <esc>:w<CR>:exec 'split term://node %' shellescape(@%, 1)<CR>
autocmd FileType javascript noremap  <buffer> <F12> 	 :w<CR>:exec '!node' shellescape(@%, 1)<CR>
autocmd FileType javascript inoremap <buffer> <F12> <esc>:w<CR>:exec '!node' shellescape(@%, 1)<CR>

