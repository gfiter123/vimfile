-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
keymap.set("n", "<leader>uI", "<cmd>IlluminateToggle<cr>", { desc = "disable Illuminate" })
keymap.set("i", "jk", "<esc>")
-- Paste over currently selected text without yanking it
keymap.set("v", "p", '"_dP', { silent = true })
