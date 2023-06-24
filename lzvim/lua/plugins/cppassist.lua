return {
  "Kohirus/cppassist.nvim",
  lazy = true,
  ft = { "h", "cpp", "hpp", "c", "cc" },
  dependencies = { { "nvim-lua/plenary.nvim" } },
  config = function()
    require("cppassist").setup()
  end,
  keys = {
    { "<A-o>", "<cmd>SwitchSourceAndHeader<cr>", desc = "SwitchSourceAndHeader" },

    -- 快速生成静态变量和函数定义
    { ";df", ":ImplementInSource<CR>", desc = "ImplementInSource" },
    { ";dv", ":ImplementOutOfClass<CR>", desc = "ImplementOutOfClass" },

    -- 快速跳转到光标处的头文件
    { ";gh", ":GotoHeaderFile<CR>", desc = "GotoHeaderFile" },
  },
}
