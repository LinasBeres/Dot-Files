-- LaTeX-to-Unicode auto-substitution, e.g. typing "\beta " turns into "β ".
-- This is julia-vim's LaTeX-input feature, not its Julia language support --
-- file_types = ".*" turns it on everywhere (not just .jl), and the
-- Tab-triggered variant is switched off so it can't fight nvim-cmp's own
-- <Tab> mapping in lsp.lua; only the as-you-type "auto" mode is used.
return {
  {
    "JuliaEditorSupport/julia-vim",
    lazy = false,
    init = function()
      vim.g.latex_to_unicode_file_types = ".*"
      vim.g.latex_to_unicode_auto = 1
      vim.g.latex_to_unicode_tab = "off"
    end,
  },
}
