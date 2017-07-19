" #--------------------------------------------------# "
" #------------- NVIM CONFIG FILE -------------------# "
" #--------------------------------------------------# "

set nocompatible

" Vim-Plug plugin 
call plug#begin('~/.vim/plugged')

" Plugins...
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-pug'
Plug 'junegunn/goyo.vim' " Distraction Free editing
Plug 'tmhedberg/matchit'
Plug 'scrooloose/nerdcommenter'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'jszakmeister/vim-togglecursor'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'plasticboy/vim-markdown'
Plug 'AlessandroYorba/Alduin'
Plug 'AlessandroYorba/Arcadia'

" End plugins
call plug#end()

" Line numbers
set number
set numberwidth=3

" Mouse scrolling on
set mouse=a

" Cursor shape and stuff
let g:togglecursor_leave = "line"

" Tab spacing
set tabstop=2
set shiftwidth=2
set expandtab

" Terminal specific
if $TERM == "myterm-it" || $TERM == "st-256color" || $TERM == "xterm-256color" 
  set termguicolors
else
  let g:gruvbox_termcolors=16
endif

" Colour scheme - Current: ALDUIN, https://github.com/AlessandroYorba/Alduin
let g:alduin_Contract_Vampirism = 1
colorscheme alduin
let g:gruvbox_italic=1
let g:arcadia_Daybreak = 1
highlight Comment cterm=italic

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Nerd Commenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1

" Goyo config
map <C-p> :Goyo<CR>
