-- General editor options
-- Ported 1:1 from the old init.vim GENERAL block.
-- syntax/filetype-plugin/filetype-indent are on by default in Neovim already.

local opt = vim.opt

-- Line numbers
opt.number = true
opt.numberwidth = 3

-- Use system clipboard
opt.clipboard = "unnamedplus"

-- Mouse
opt.mouse = "a"

-- Cursor shape per mode (replaces vim-togglecursor; works natively, no
-- terminal-escape-code hacks needed even inside tmux)
opt.guicursor =
  "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Tab/spaces
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 0
opt.softtabstop = 4

-- General improvements
opt.encoding = "utf-8"
opt.scrolloff = 3
opt.autoindent = true
opt.showmode = true
opt.showcmd = true
opt.hidden = true
opt.wildmenu = true
opt.wildmode = "list:longest"
opt.visualbell = true
opt.cursorline = true
opt.ttyfast = true
opt.ruler = true
opt.backspace = { "indent", "eol", "start" }
opt.laststatus = 2
opt.undofile = true

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true
opt.incsearch = true
opt.showmatch = true
opt.hlsearch = true

-- Extra symbols
opt.list = true
opt.listchars = { tab = "▸ ", eol = "¬" }

opt.updatetime = 300
opt.signcolumn = "yes"

-- Explicit fold markers
opt.foldmethod = "marker"

-- Keep reading/writing marks, registers and command history from the same
-- file vim used, so nothing gets "lost" by moving off viminfo.
opt.shada = "'100,n" .. vim.fn.expand("$HOME/.vim/files/info/viminfo")

-- Enable Neovim's bundled matchit (extends % matching), replacing the
-- external tmhedberg/matchit plugin with the same behavior.
vim.cmd("packadd! matchit")
