require("lazyvim.config.options")
require("myplugin")
require("lazyvim.config.lazy")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("lazyvim.config.autocmds")
    require("lazyvim.config.keymaps")
  end,
})
