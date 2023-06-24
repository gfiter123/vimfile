--bufferline 添加index显示
return {
  "akinsho/bufferline.nvim",
  keys = {
    { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "BufferPick" },
    { "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "BufferGoTo 1" },
    { "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "BufferGoTo 2" },
    { "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "BufferGoTo 3" },
    { "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "BufferGoTo 4" },
    { "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "BufferGoTo 5" },
    { "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "BufferGoTo 6" },
    { "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "BufferGoTo 7" },
    { "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "BufferGoTo 8" },
    { "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "BufferGoTo 9" },
    { "<leader>0", "<cmd>BufferGoToLast<cr>", desc = "BufferGoToLast" },
  },
  opts = {
    -- use_diagnostic_signs = true,
    options = {
      numbers = function(opts)
        return string.format(" %s-%s", vim.fn["tabpagenr"](), opts.ordinal)
      end,
    },
  },
}
