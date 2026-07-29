-- Replaces vim-airline + vim-airline-themes.
-- theme = 'auto' derives colors from the active colorscheme (alduin), so it
-- never clashes the way a fixed airline theme could. The tabline section
-- replicates airline's tabline#enabled=1 (buffer list across the top).
return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
      },
      tabline = {
        lualine_a = {
          {
            "buffers",
            buffers_color = {
              -- active keeps the theme's normal colors, just bolded
              active = { gui = "bold" },
              -- inactive gets muted to a dimmer fg so the active buffer stands out
              inactive = {},
            },
          },
        },
        lualine_z = { "tabs" },
      },
    },
    config = function(_, opts)
      -- Derive "muted" from the colorscheme's own Comment color instead of a
      -- hardcoded hex, so it stays correct if the colorscheme ever changes.
      local ok, comment_hl = pcall(vim.api.nvim_get_hl, 0, { name = "Comment", link = false })
      if ok and comment_hl.fg then
        opts.tabline.lualine_a[1].buffers_color.inactive.fg = string.format("#%06x", comment_hl.fg)
      end
      require("lualine").setup(opts)
    end,
  },
}
