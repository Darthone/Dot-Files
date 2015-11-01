set all& " reset all settings

syntax on
set background=dark
colorscheme molokai

set nocompatible              " be iMproved, required
filetype off                  " required

"to install vundle
"git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'osyo-manga/vim-brightest'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/cSyntaxAfter'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-expand-region'


"To install vundle plugins 
"vim +PluginInstall +qall
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" indenting
set backspace=indent,eol,start
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

set showtabline=2
set laststatus=2


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"execute for pathogen install
"mkdir -p ~/.vim/autoload ~/.vim/bundle && \
"curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()

"shortcuts
let mapleader = "\<Space>"
nnoremap <Leader>2 :%s/\s\+$//e<CR>
nmap <Leader><Leader> V
nnoremap <Leader>w :w<CR>

set pastetoggle=<F3>
nnoremap <F2> :set invnumber<CR>
map <F4> :NERDTreeToggle<CR>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd! BufRead,BufNewFile,BufEnter *.{c,cpp,h,javascripti,py} call CSyntaxAfter()

"let g:pydiction_location = '/home/dario/.vim/bundle/pydiction/complete-dict'
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

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
