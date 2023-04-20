" lightline settings
set laststatus=2
set noshowmode

" set 256 colors
if !has('gui_running')
	set t_Co=256
endif

" lightline components
let g:lightline = {
      \ 'colorscheme': 'apprentice',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'modified' ],
      \             [ 'gitbranch' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ }

" numbers next to the buffer name
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#number_separator = ''
let g:lightline#bufferline#number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}

" lightline maps
" switch to buffer by its ordinal number
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nmap <Leader>w1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>w2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>w3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>w4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>w5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>w6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>w7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>w8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>w9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>w0 <Plug>lightline#bufferline#delete(10)
