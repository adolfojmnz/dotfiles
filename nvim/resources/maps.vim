"vsplit<CR> disable hls
noremap <F2> :nohls<CR>

" move to the next empty space after or before a parragraph

" save :w
noremap  <buffer> <F9> 		 :w<CR>
inoremap <buffer> <F9> <esc> :w<CR>

" NERDTree maps
noremap  <F5>  		 :NERDTree<CR>
inoremap <F5>  <esc> :NERDTree<CR>
noremap  <F10> 		 :NERDTreeToggle<CR>
inoremap <F10> <esc> :NERDTreeToggle<CR>

" delete white spaces
noremap <F1> :FixWhitespace<cr>

" auto completion
inoremap <silent><expr> <c-space> coc#refresh()

" move between windows
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" Split window
noremap ss :split<Return>
noremap sv :vsplit<Return>

" Resize window
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

" Print working directory
noremap <F3> :!pwd<CR>

" Here start nschurmann's mappings
" quick semicolon
nnoremap <Leader>; $a;<Esc>

" save buffer, quit and
" quit discarting changes
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" plugs
map <Leader>p :Files<CR>

" buffers
map <Leader>b :Buffers<cr>

" faster scrolling
nnoremap <Leader>j 10<C-e>
nnoremap <Leader>k 10<C-y>

set splitright
function! OpenTerminal()
  " move to right most buffer
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else
    " open terminal
    execute "vsp term://zsh"

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>
