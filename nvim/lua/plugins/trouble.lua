-- Pretty, navigable list for diagnostics/quickfix/loclist. Complements the
-- vim.diagnostic mappings already set up in lsp.lua (<space>e, [d/]d, <space>q).
return {
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
}
