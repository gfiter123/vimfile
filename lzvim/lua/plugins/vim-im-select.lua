--im-select.exe 下载地址：https://github.com/daipeihust/im-select/raw/master/win/out/x86/im-select.exe
--mac端下载地址 brew install im-select或curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install_mac.sh | sh

return {
  {
    "brglng/vim-im-select",
    event = { "BufEnter" },
    config = function()
      vim.g.im_select_command = "/mnt/e/Software/im-select/im-select.exe"
      vim.g.im_select_default = "1033"
      vim.g.im_select_enable_focus_events = 0
    end,
  },
}
