-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
keymap.set("n", "<leader>uI", "<cmd>IlluminateToggle<cr>", { desc = "disable Illuminate" })
keymap.set("i", "jk", "<esc>")
-- Paste over currently selected text without yanking it
keymap.set("v", "p", '"_dP', { silent = true })
keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "ToggleTerm" })
keymap.set(
  "n",
  "<leader>fs",
  ":lua require'telescope.builtin'.grep_string(require('telescope.themes').get_ivy({}))<cr>",
  { desc = "Telescope grep_string" }
)
keymap.set(
  "n",
  "<leader>fg",
  ":lua require'telescope.builtin'.live_grep(require('telescope.themes').get_ivy({}))<cr>",
  { desc = "Telescope live_grep" }
)
