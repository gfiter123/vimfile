return {
  {
    "lfv89/vim-interestingwords",
    event = { "BufEnter", "CursorMoved", "BufNewFile" },
    config = function()
      vim.api.nvim_command(
        "let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']"
      )
    end,
  },
  {
    "tpope/vim-surround",

    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- ( end )
  },
}
