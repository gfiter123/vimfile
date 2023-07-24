-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
-- keymap.set("n", "J", "5j", { expr = true, silent = true })
-- keymap.set("n", "K", "5k", { expr = true, silent = true })
keymap.set("n", "<leader>uI", "<cmd>IlluminateToggle<cr>", { desc = "disable Illuminate" })
keymap.set("i", "jk", "<esc>")
keymap.set("i", "<C-h>", "Left")
keymap.set("i", "<C-l>", "Right")
keymap.set("i", "<C-j>", "Down")
keymap.set("i", "<C-k>", "Up")
-- Paste over currently selected text without yanking it
keymap.set("v", "p", '"_dP', { silent = true })
-- keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "ToggleTerm" })
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
keymap.set("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Run or Continue" })
keymap.set("n", "<F4>", function()
  require("dap").run_to_cursor()
end, { desc = "Run to Cursor" })
keymap.set("n", "<F9>", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
keymap.set("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Toggle Breakpoint" })
keymap.set("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Toggle Breakpoint" })
