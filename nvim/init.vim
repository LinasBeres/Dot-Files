" #--------------------------------------------------# "
" #------------- NVIM CONFIG FILE -------------------# "
" #--------------------------------------------------# "

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

" Italics control
if $TERM == "myterm-it" || $TERM == "st-256color" || $TERM == "xterm-256color-italic"
  let g:gruvbox_italic=1
endif

" Colour scheme - Current: GRUVBOX, https://github.com/morhetz/gruvbox
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme gruvbox
set background=dark

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Nerd Commenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1

" Goyo config
map <C-p> :Goyo<CR>
