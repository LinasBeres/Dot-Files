" #--------------------------------------------------# "
" #------------- NVIM CONFIG FILE -------------------# "
" #--------------------------------------------------# "

set nocompatible

" Vim-Plug {{{
call plug#begin('~/.vim/plugged')

" Plugins...
Plug 'morhetz/gruvbox'
Plug 'AlessandroYorba/Alduin'
Plug 'AlessandroYorba/Arcadia'
Plug 'NLKNguyen/papercolor-theme'

Plug 'junegunn/goyo.vim' " Distraction Free editing
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

Plug 'plasticboy/vim-markdown'
Plug 'kchmck/vim-coffee-script'
" Plug 'ap/vim-css-color'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'cakebaker/scss-syntax.vim'
Plug 'digitaltoad/vim-pug'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Plug 'hdima/python-syntax'
" Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'dag/vim-fish'

Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki'
Plug 'mattn/calendar-vim'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tmhedberg/matchit'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'ervandew/supertab'
Plug 'jszakmeister/vim-togglecursor'
Plug 'bronson/vim-trailing-whitespace'
Plug 'kien/ctrlp.vim'

" End plugins
call plug#end()

" }}}

" GENERAL {{{

" Line numbers
set number
set numberwidth=3

" Mouse scrolling on
set mouse=a

" Cursor shape and stuff
let g:togglecursor_leave = "underline"

" Tab spacing
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" General improvments
set encoding=UTF-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <Tab> %
vnoremap <Tab> %

" Extra symbols
set list
set listchars=tab:▸\ ,eol:¬

" Save on exit
au FocusLost * :wa

" Terminal specific
" if $TERM == "myterm-it" || $TERM == "st-256color" || $TERM == "xterm-256color"
  " set termguicolors
" else
  " let g:gruvbox_termcolors=16
" endif

" }}}

"        KEYBINDINGS {{{
" ==========================

" leader in coma
let mapleader = ";"
" but keep the old one too
nmap \ ;

" move around the splits with ;j etc.
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

" move around the splits with Ctrl+Alt+j etc.
nnoremap <C-A-j> <C-w>j
nnoremap <C-A-k> <C-w>k
nnoremap <C-A-h> <C-w>h
nnoremap <C-A-l> <C-w>l
" Note: you may want to change the lock screen combination to Mod4-L...


" move splits up and down
nnoremap <leader>J <C-w>x<C-w>j
nnoremap <leader>K <C-w>k<C-w>x

" open new splits and move there
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>l

" no ex mode (type visual to go back to sanity)
nnoremap Q <Nop>

imap <A-e> <Esc>
vmap <A-e> <Esc>
smap <A-e> <Esc>


"}}}

set foldmethod=marker  " explicit markers {{{ and }}}

"        PLUGIN CONFIG {{{
" ===========================

" Colour scheme
let g:alduin_Contract_Vampirism = 1
colorscheme alduin
let g:gruvbox_italic=1
let g:arcadia_Daybreak = 1
" highlight Comment cterm=italic
highlight Folded ctermfg=8 ctermbg=233 guifg=#5f0000 guibg=#121212

" Airline Stuff
let g:airline#extensions#tabline#enabled = 1

" Nerd Tree
map <Leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Nerd Commenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1

" Goyo config
map <C-p> :Goyo<CR>

let g:jsx_ext_required = 0

" Python3 syntax
let g:pymode_python = 'python3'

"}}}
