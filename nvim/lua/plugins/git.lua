-- vim-gitgutter has no support at all for untracked files (confirmed: no
-- "untracked"/"intent-to-add" handling anywhere in its source) -- pulling
-- forward the already-approved Phase 2 swap to gitsigns.nvim, which can
-- show signs for untracked files. Sign characters matched to gitgutter's
-- defaults (+/~/_) to keep the look the same; attach_to_untracked is new.
return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~_" },
        untracked = { text = "+" },
      },
      attach_to_untracked = true,
    },
  },
  { "tpope/vim-fugitive", lazy = false },
}
