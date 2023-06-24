local setup, auto_cursorline = pcall(require, "auto-cursorline")
if not setup then
  vim.notify("auto-cursorline not found")
  return
end
require("auto-cursorline").setup({})
