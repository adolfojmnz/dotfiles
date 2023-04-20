"" settings
let g:mapleader = " "

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
				\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
				\,sm:block-blinkwait175-blinkoff150-blinkon175

set ruler
set number
set hidden
set splitbelow
set splitright
set scrolloff=3
set cmdheight=1
set pumheight=10
set encoding=utf-8
set fileencoding=utf-8

set showtabline=4
set updatetime=300
set timeoutlen=500
set formatoptions-=cro

set clipboard=unnamedplus
set autochdir

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" hard ass mode (disables all the keys listed bellow)
for key in ['<Up>', '<Down>', '<Left>', '<Right>', '<Home>', '<End>']
	exec 'noremap' key '<Nop>'
	exec 'inoremap' key '<Nop>'
endfor

" Here start Nicolas(z) Schurman's settings
au BufNewFile,BufRead *.html set filetype=htmldjango
