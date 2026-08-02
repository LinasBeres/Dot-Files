-- Vertical indent guides. Independent from treesitter's indent *module*
-- (deliberately left disabled in treesitter.lua to keep cindent behavior) --
-- this only draws guide characters, it doesn't touch indentexpr.
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = false,
    opts = {},
  },
}
