" #--------------------------------------------------# "
" #------------- NVIM CONFIG FILE -------------------# "
" #--------------------------------------------------# "

set nocompatible

" Vim-Plug plugin
call plug#begin('~/.vim/plugged')

" Plugins...
Plug 'morhetz/gruvbox'
Plug 'AlessandroYorba/Alduin'
Plug 'AlessandroYorba/Arcadia'
Plug 'NLKNguyen/papercolor-theme'
Plug 'whatyouhide/vim-gotham'

Plug 'junegunn/goyo.vim' " Distraction Free editing
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanss/vim-hackernews'

Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
Plug 'kchmck/vim-coffee-script'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'digitaltoad/vim-pug'
Plug 'elzr/vim-json'
Plug 'lervag/vimtex'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'klen/python-mode'

Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki'
Plug 'mattn/calendar-vim'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tmhedberg/matchit'
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify' " Alternative to gitgutter
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'ervandew/supertab'
Plug 'jszakmeister/vim-togglecursor'
Plug 'bronson/vim-trailing-whitespace'

" End plugins
call plug#end()

" Line numbers
set number
set numberwidth=3

" Mouse scrolling on
set mouse=a

" Tab spacing
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" General improvments
set encoding=utf-8
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
nnoremap <tab> %
vnoremap <tab> %

" Extra symbols
set list
set listchars=tab:▸\ ,eol:¬

" Save on exit
au FocusLost * :wa

" Terminal specific
if $TERM == "myterm-it" || $TERM == "st-256color" || $TERM == "xterm-256color"
  set termguicolors
endif


"        PLUGIN CONFIG
" ===========================
"
" Colour scheme
let g:alduin_Contract_Vampirism = 1
let g:gruvbox_italic=1
let g:arcadia_Daybreak = 1
colorscheme alduin
highlight Comment cterm=italic
highlight Folded ctermfg=109 ctermbg=233 guifg=#87afaf guibg=#121212

" Airline Stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "lucius"

" Nerd Tree
map <Leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Nerd Commenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1

" Goyo config
map <C-p> :Goyo<CR>

" Some sort of latex bug
let g:polyglot_disabled = ['latex']

" Gitgutter error
let g:gitgutter_realtime = 0
