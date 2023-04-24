call plug#begin('~/.config/nvim/plugged')

" Stetics
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/vim-cursorword'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'khaveesh/vim-fish-syntax'
Plug 'airblade/vim-gitgutter'

" File Manager
Plug 'scrooloose/nerdtree'
Plug 'EvanDotPro/nerdtree-symlink'

" Typign
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

" Databases
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'guysherman/pg.nvim'

call plug#end()
