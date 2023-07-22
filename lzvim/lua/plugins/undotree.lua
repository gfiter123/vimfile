return {
  "mbbill/undotree",
  -- cmd = "UndotreeToggle",
    keys = {
      { "U", "<cmd>UndotreeToggle<CR>" },
    },
  config = function()
    vim.cmd([[
      let undotree_dir = '~/.undodir/nvim' 
      if has("persistent_undo")
        " 在 config.lua 中定义好了 undotree_dir 全局变量
        let target_path = expand(undotree_dir)
      if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
      endif
      let &undodir = target_path
      set undofile
    ]])
  end,
}
