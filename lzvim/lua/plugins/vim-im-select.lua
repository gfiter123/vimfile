--im-select.exe 下载地址：https://github.com/daipeihust/im-select/raw/master/win/out/x86/im-select.exe
--mac端下载地址 brew install im-select或curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install_mac.sh | sh

return {
  {
    "brglng/vim-im-select",
    event = { "BufEnter" },
    config = function()
      vim.cmd([[
      if !empty(glob("/mnt/c"))
        let g:im_select_command = "/mnt/e/Software/im-select/im-select.exe"
        let g:im_select_default = "1033"
        let g:im_select_enable_focus_events = 0
        "退出插入模式时自动切换英文输入法
        autocmd InsertLeave * :silent !/mnt/e/Software/im-select/im-select.exe 1033

      elseif !empty(glob("/mnt/public"))
        "ibus
        autocmd InsertLeave * :silent !/usr/bin/ibus engine xkb:us::eng 
        autocmd BufCreate * :silent !/usr/bin/ibus engine xkb:us::eng 
        autocmd BufEnter * :silent !/usr/bin/ibus engine xkb:us::eng 
        autocmd BufLeave * :silent !/usr/bin/ibus engine xkb:us::eng 
      endif

      ]])
    end,
  },
}
