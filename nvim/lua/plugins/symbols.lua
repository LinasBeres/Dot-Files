-- Replaces vista.vim. LSP-backed (falls back to treesitter), so no ctags
-- dependency needed, unlike vista.
return {
  {
    "stevearc/aerial.nvim",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
    },
    opts = {},
  },
}
