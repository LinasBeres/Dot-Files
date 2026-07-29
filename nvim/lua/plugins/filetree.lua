-- Replaces NERDTree + nerdtree-git-plugin + vim-devicons.
-- git status column is on by default; nvim-web-devicons gives file icons.
return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      -- Recommended by nvim-tree: netrw conflicts with it otherwise.
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    opts = {
      git = { enable = true },
      renderer = {
        icons = {
          -- Extra breathing room after each icon glyph -- Nerd Font icons
          -- often render slightly wider than the single terminal cell nvim
          -- allocates them, so the next character can visually clip into
          -- them. This doesn't fix the root cause (that's the terminal
          -- font -- see chat), but gives it more room to avoid the overlap.
          padding = { icon = "  " },
        },
      },
    },
  },
}
