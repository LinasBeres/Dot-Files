-- Popup showing available completions for a pending keybinding (e.g. after
-- pressing <leader>), so the growing set of mappings in keymaps.lua and the
-- LSP mappings in lsp.lua stay discoverable without memorizing them.
return {
  {
    "folke/which-key.nvim",
    lazy = false,
    opts = {},
  },
}
