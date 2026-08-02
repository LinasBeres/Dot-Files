-- All 4 colorschemes are kept installed and available; alduin stays active.
return {
  {
    "morhetz/gruvbox",
    lazy = false,
    init = function()
      vim.g.gruvbox_italic = 1
    end,
  },
  {
    "AlessandroYorba/Alduin",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.alduin_Contract_Vampirism = 1
    end,
    config = function()
      vim.cmd.colorscheme("alduin")
      vim.api.nvim_set_hl(0, "Folded", {
        ctermfg = 8,
        ctermbg = 233,
        fg = "#5f0000",
        bg = "#121212",
      })
      -- Make LSP errors impossible to miss: a solid red background behind
      -- the offending text, instead of alduin's default (subtler) underline.
      -- ctermbg (not bg/fg) so this renders without termguicolors.
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
        ctermbg = 1,
      })
    end,
  },
  {
    "AlessandroYorba/Arcadia",
    lazy = false,
    init = function()
      vim.g.arcadia_Daybreak = 1
    end,
  },
  { "NLKNguyen/papercolor-theme", lazy = false },
}
