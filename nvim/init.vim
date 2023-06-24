source $HOME/.config/nvim/vim/cppassist.vim
source $HOME/.config/nvim/vim/md.vim
lua require("core.plugins")
lua require("core.options")
lua require("core.keymaps")
lua require("core.colorscheme")
lua require("plugins.impatient")  
lua require("plugins.notify")  
lua require("plugins.comment")
lua require("plugins.nvim-tree")
lua require("plugins.lualine")
lua require("plugins.bufferline").config()
lua require("plugins.hop").config()
lua require("plugins.nvim-lastplace")
lua require("plugins.telescope")
lua require("plugins.nvim-cmp")
lua require("plugins.lsp.mason")
lua require("plugins.lsp.lspconfig")
lua require("plugins.litee-family")  
lua require("plugins.lsp.null-ls")
lua require("plugins.lsp.trouble")
lua require("plugins.autopairs")
lua require("plugins.treesitter-context")
lua require("plugins.treesitter")
lua require("plugins.gitsigns")
lua require("plugins.aerial")
lua require("plugins.nvim-session-manager")
lua require("plugins.autopairs")
lua require("plugins.alpha")
lua require("plugins.autocommands")
lua require("plugins.autosave")
" lua require("plugins.clipper")   "远程剪切板
lua require("plugins.diffview")
lua require("plugins.fidget")  
lua require("plugins.high-str")  
lua require("plugins.indent-blankline")  
lua require("plugins.whichkey")  
" 颜色显示
lua require("plugins.nvim-colorizer")    
" 大括号提示
lua require("plugins.nvim-biscuits")  
" /搜索结果提示
lua require("plugins.nvim-hlslens")  
" code action灯泡提示
lua require("plugins.nvim-lightbulb")  
"历史剪切板 
"lua require("plugins.nvim-neoclip")  
"字符替换
lua require("plugins.nvim-spectre")  

lua require ("plugins.dap")
lua require("plugins.nvim-cppassit").config()
 " ========= Other custom external setting config(Optional) ==========
if filereadable($HOME . "/.config/nvim/vim/cpp_autoheader.vim")
    source $HOME/.config/nvim/vim/cpp_autoheader.vim
endif


