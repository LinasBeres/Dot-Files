return {
  {
    "vimwiki/vimwiki",
    lazy = false,
    init = function()
      vim.g.vimwiki_list = {
        {
          path = vim.fn.expand("$HOME/Bibliography/summaries"),
          index = "summaries",
        },
      }
    end,
  },
  { "mattn/calendar-vim", lazy = false },
}
