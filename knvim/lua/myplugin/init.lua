
require("myplugin.lua.nvim-cursorline").setup()

vim.cmd([[
for f in split(glob('~/.config/nvim/lua/myplugin/vim/*.vim'), '\n')
     exe 'source' f
 endfor
]]);
