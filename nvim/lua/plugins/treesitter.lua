-- Replaces vim-polyglot, vim-cpp-enhanced-highlight and vim-svelte with
-- Neovim's native treesitter highlighting engine.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "python",
        "lua",
        "vim",
        "vimdoc",
        "svelte",
        "typescript",
        "javascript",
        "css",
        "json",
        "bash",
        "cmake",
      },
      auto_install = true,
      highlight = { enable = true },
      -- Deliberately NOT enabling the indent module: it overrides
      -- 'indentexpr' with treesitter's own (still-experimental) indent
      -- logic, which breaks normal C/C++ brace-based auto-indent. Leaving
      -- this off keeps the same cindent-based indentation as before.
      indent = { enable = false },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
