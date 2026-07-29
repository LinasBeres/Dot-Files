-- All keybindings live here, mirroring the old single KEYBINDINGS block.
-- Plugin spec files never define keymaps of their own -- they only reference
-- the commands used below, so this file is always the one place to look.

local map = vim.keymap.set

-- Leader: semicolon, with backslash kept working as a backup leader too
vim.g.mapleader = ";"
map("n", "\\", ";", { remap = true, desc = "Backup leader (same as ;)" })

-- Window navigation with ;j / ;k / ;h / ;l
map("n", "<leader>j", "<C-w>j", { desc = "Go to window below" })
map("n", "<leader>h", "<C-w>h", { desc = "Go to window left" })
map("n", "<leader>l", "<C-w>l", { desc = "Go to window right" })
-- NOTE: <leader>k used to also mean "go to window above", but a later
-- mapping in the old config silently overrode it with :Files (fzf) -- that
-- was confirmed as the behavior you actually rely on, so it's kept as
-- :Files below and window-above now only lives on <C-A-k>.

-- Window navigation with Ctrl-Alt+jkhl
map("n", "<C-A-j>", "<C-w>j", { desc = "Go to window below" })
map("n", "<C-A-k>", "<C-w>k", { desc = "Go to window above" })
map("n", "<C-A-h>", "<C-w>h", { desc = "Go to window left" })
map("n", "<C-A-l>", "<C-w>l", { desc = "Go to window right" })

-- Move splits up and down
map("n", "<leader>J", "<C-w>x<C-w>j", { desc = "Move split down" })
map("n", "<leader>K", "<C-w>k<C-w>x", { desc = "Move split up" })

-- Open new splits and move there
map("n", "<leader>s", "<C-w>s<C-w>l", { desc = "Open horizontal split" })
-- NOTE: this used to live on <leader>v, but a later mapping in the old
-- config silently overrode it with :Vista!! (symbol outline) -- that was
-- confirmed as the behavior you actually rely on, so the symbol-outline
-- toggle (now :AerialToggle) keeps <leader>v and vertical-split moved to
-- <leader>o.
map("n", "<leader>o", "<C-w>v<C-w>l", { desc = "Open vertical split" })

-- No ex mode (type :visual to go back to sanity)
map("n", "Q", "<Nop>")

-- Auto-close brackets with a trailing statement terminator
map("i", "(;", "(<CR>);<C-c>O")
map("i", "(,", "(<CR>),<C-c>O")
map("i", "{;", "{<CR>};<C-c>O")
map("i", "{,", "{<CR>},<C-c>O")
map("i", "[;", "[<CR>];<C-c>O")
map("i", "[,", "[<CR>],<C-c>O")

-- Avoid the escape key
map("i", "jj", "<Esc>")
map("i", "<A-e>", "<Esc>")
map("v", "<A-e>", "<Esc>")
map("s", "<A-e>", "<Esc>")

-- EZ save
map("n", "<A-s>", ":w<CR>")

-- Comment toggle (native gc/gcc, Neovim 0.10+) -- remap = true so it goes
-- through the real built-in <Plug> mappings instead of typing literal keys.
-- NOTE: the old NERDCommenterToggle() mapping here was actually already
-- broken (missing :call/<Plug>, so Alt-c typed literal text) -- this is the
-- first time Alt-c genuinely toggles a comment.
map("n", "<A-c>", "gcc", { remap = true })
map("v", "<A-c>", "gc", { remap = true })
-- Same toggle, reachable via <leader> too (no clash: <leader>cc is the only
-- normal-mode <leader>c* mapping, and <leader>c in visual mode doesn't
-- collide with it since it's a different mode).
map("n", "<leader>cc", "gcc", { remap = true })
map("v", "<leader>c", "gc", { remap = true })

-- Switch between .cpp/.h via clangd (supersedes a.vim's :A, which this
-- mapping already silently overrode in the old config)
map("n", "<A-a>", ":ClangdSwitchSourceHeader<CR>")

-- Buffer cycling
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- File tree toggle (nvim-tree)
map("n", "<A-n>", ":NvimTreeToggle<CR>")
map("n", "<leader>n", ":NvimTreeToggle<CR>")

-- FZF
map("n", "<A-k>", ":Files<CR>")
map("n", "<leader>k", ":Files<CR>")
map("n", "<A-r>", ":Rg!<CR>")
map("n", "<leader>r", ":Rg<CR>")

-- Symbol outline (aerial.nvim, LSP-backed)
map("n", "<leader>v", ":AerialToggle<CR>")

-- Close buffer without closing the window/split
map("n", "<leader>d", ":bp<bar>sp<bar>bn<bar>bd<CR>", { silent = true })

-- Distraction-free mode
map("n", "<C-g>", ":Goyo<CR>")

-- Vimwiki link navigation
map("n", "<leader>wt", "<Plug>VimwikiNextLink")
map("n", "<leader>wrt", "<Plug>VimwikiPrevLink")

-- Searching: very-magic mode by default, clear highlight with ;<space>
map("n", "/", "/\\v")
map("v", "/", "/\\v")
map("n", "<leader><space>", ":noh<CR>")
