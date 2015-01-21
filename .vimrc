set all& 

syntax on

set background=dark
colorscheme molokai

set backspace=indent,eol,start

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'osyo-manga/vim-brightest'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

filetype plugin on
filetype indent on

set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set number   
set incsearch
set hlsearch
set scrolloff=12
set showmatch 
set cursorline

execute pathogen#infect()
set pastetoggle=<F3>
nnoremap <F2> :set invnumber<CR>
"nnoremap <F2> :wq<CR>
map <F4> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd! BufRead,BufNewFile,BufEnter *.{c,cpp,h,javascripti,py} call CSyntaxAfter()

"let g:pydiction_location = '/home/dario/.vim/bundle/pydiction/complete-dict'
"
"let g:SuperTabDefaultCompletionType = "context"
let g:jedi#completions_command = "<Tab>"
autocmd FileType python setlocal completeopt-=preview

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au VimEnter * RainbowParenthesesLoadRound
au VimEnter * RainbowParenthesesLoadSquare
au VimEnter * RainbowParenthesesLoadBraces


