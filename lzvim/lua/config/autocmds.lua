-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- 退出 neovim 时恢复光标为垂直光标
-- NOTE: VimSuspend
local cursorGrp = augroup("RestroeCursorShapeOnExit", { clear = true })
autocmd("VimLeave", {
	pattern = "*",
	command = "set guicursor=a:ver25",
	group = cursorGrp,
})

-- 进入插入模式时自动切换中文输入法
-- local methodGrp = augroup("AutoSwitchInputMethod", { clear = true })
-- autocmd("InsertEnter", {
-- 	pattern = "*",
-- 	command = 'silent exec "!(/mnt/e/Software/im-select/im-select.exe 2052) &"',
-- 	group = methodGrp,
-- })
--
-- -- 进入VIM时自动切换英文输入法
-- autocmd("VimEnter", {
-- 	pattern = "*",
-- 	command = 'silent exec "!(/mnt/e/Software/im-select/im-select.exe 1033) &"',
-- 	group = methodGrp,
-- })

-- 关闭新行自动注释
autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})

