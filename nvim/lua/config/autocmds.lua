local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Save all buffers when focus leaves the terminal
autocmd("FocusLost", {
  group = augroup("SaveOnFocusLost", { clear = true }),
  pattern = "*",
  command = "silent! wa",
})

-- .cppm (C++ module) files are C++
autocmd({ "BufReadPost", "BufNewFile" }, {
  group = augroup("CppModuleFiletype", { clear = true }),
  pattern = "*.cppm",
  callback = function()
    vim.bo.syntax = "cpp"
    vim.bo.filetype = "cpp"
  end,
})

-- Flash yanked text (replaces vim-highlightedyank, matching its default
-- highlight group and duration exactly).
autocmd("TextYankPost", {
  group = augroup("HighlightYank", { clear = true }),
  callback = function()
    (vim.hl or vim.highlight).on_yank({ higroup = "IncSearch", timeout = 1000 })
  end,
})

-- Quit if the file tree is the last window left in the tab (same BufEnter-
-- driven check the old NERDTree config used, just re-pointed at nvim-tree's
-- buffer name). Deliberately NOT using the "QuitPre + close tree windows"
-- pattern some nvim-tree docs suggest -- that one interferes with :qa!
-- (confirmed: it left nvim hung, needing SIGTERM, when :qa! ran with the
-- tree open). This BufEnter version only ever fires from normal buffer
-- navigation, so it can't interfere with a quit-all command.
autocmd("BufEnter", {
  group = augroup("FileTreeAutoQuit", { clear = true }),
  pattern = "NvimTree_*",
  callback = function()
    if vim.fn.winnr("$") == 1 then
      vim.cmd("quit")
    end
  end,
})
