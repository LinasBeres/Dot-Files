-- fzf assumes fzf is already installed at ~/.fzf, same as before.
return {
  { dir = vim.fn.expand("~/.fzf"), lazy = false },
  { "junegunn/fzf", lazy = false },
  { "junegunn/fzf.vim", lazy = false, dependencies = { "junegunn/fzf" } },
}
