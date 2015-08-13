set nocompatible
syntax on

" No more indented paste
set paste

set showmatch

" search like in modern browser
set incsearch

" For regex turn magic on
set magic

"highlight comment ctermfg=lightblue
"highlight special ctermfg=yellow
"highlight nontext ctermfg=white

" auto indent
set ai

" Smart indent
set si

" wrap lines
set wrap

" Display line/column
set ruler

" Toggle paste mode on and off
map<leader>pp :setlocal paste!<cr>

" Enable Pig highlighting

augroup filetypedetect
au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END


" Map F4 to toggle search highlighting
noremap <F4> :set hlsearch! hlsearch?<CR>
set tabstop=4
set shiftwidth=4

filetype plugin on

execute pathogen#infect()
colorscheme elflord

