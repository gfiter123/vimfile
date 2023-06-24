--silent 取消按键提示
--noremap 取消多次按键map
local opts = { noremap = true, silent = true }

vim.g.mapleader = ";"

--空格rc，打开配置文件，c-o返回
vim.keymap.set("n", "<leader>rc", ":e ~/.config/nvim/init.vim <cr>", opts)

--"="  查找下一个
--"-"  查找上一个
vim.keymap.set("n", "=", "nzz", opts)
vim.keymap.set("n", "-", "Nzz", opts)
--取消高亮
vim.keymap.set("n", "<leader><cr>", ":nohlsearch<cr>", opts)

-- quick save and esc
vim.keymap.set("n", "<c-s>", ":w<enter>", opts)
vim.keymap.set("i", "jk", "<esc>", opts)

-- quick movement
vim.keymap.set("n", "J", "5j", opts)
vim.keymap.set("n", "K", "5k", opts)
vim.keymap.set("n", "H", "0", opts)
vim.keymap.set("n", "L", "$", opts)

vim.keymap.set("n", "dL", "d$", opts)
vim.keymap.set("n", "dH", "d0", opts)

-- vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "Q", ":q!<enter>", opts)
vim.keymap.set("v", "Y", '"+y', opts)
vim.keymap.set("n", "<", "<<", opts)
vim.keymap.set("n", ">", ">>", opts)
vim.keymap.set("n", "<leader>o", "za", opts)

--markdown
vim.keymap.set("n", "<leader><leader>", "<Esc>/<++><CR>:nohlsearch<CR>4xi", opts)
--打开拼写检查
vim.keymap.set("n", "<leader>sc", ":set spell!<cr>", opts)

vim.keymap.set("n", "<leader>sw", ":set wrap!<cr>", opts)

-- Stay in indent mode when you indent code
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
-- Move text up and down
vim.keymap.set("n", "<A-down>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<A-up>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "<A-down>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<A-up>", ":m '<-2<CR>gv=gv", opts)
-- replace what you highlight
vim.keymap.set("v", "p", '"_dP', opts)

-- split screen
vim.keymap.set("n", "sk", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", opts)
vim.keymap.set("n", "sj", ":set splitbelow<CR>:split<CR>", opts)
vim.keymap.set("n", "sh", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", opts)
vim.keymap.set("n", "sl", ":set splitright<CR>:vsplit<CR>", opts)
-- cursor jumper between screen
vim.keymap.set("n", "<leader>l", "<c-w>l", opts)
vim.keymap.set("n", "<leader>k", "<c-w>k", opts)
vim.keymap.set("n", "<leader>h", "<c-w>h", opts)
vim.keymap.set("n", "<leader>j", "<c-w>j", opts)
vim.keymap.set("n", "qf", "<c-w>o", opts)

-- set split screen preference
vim.keymap.set("n", "sv", "<C-w>t<C-w>H", opts)
vim.keymap.set("n", "sh", "<C-w>t<C-w>K", opts)
-- rotate screen
vim.keymap.set("n", "srh", "<C-w>b<C-w>K", opts)
vim.keymap.set("n", "srv", "<C-w>b<C-w>H", opts)

-- adjust window size
vim.keymap.set("n", "<up>", ":res +5<cr>", opts)
vim.keymap.set("n", "<down>", ":res -5<cr>", opts)
vim.keymap.set("n", "<left>", ":vertical resize+5<cr>", opts)
vim.keymap.set("n", "<right>", ":vertical resize-5<cr>", opts)

-- tab management
vim.keymap.set("n", "ti", ":tabe<cr>", opts)
vim.keymap.set("n", "th", ":-tabnext<cr>", opts)
vim.keymap.set("n", "tl", ":+tabnext<cr>", opts)
-- move tabs
vim.keymap.set("n", "tmh", ":-tabmove<cr>", opts)
vim.keymap.set("n", "tml", ":+tabmove<cr>", opts)

-- buffer switcher
vim.keymap.set("n", "bh", ":bp<cr>", opts)
vim.keymap.set("n", "bl", ":bn<cr>", opts)

-- quickfix and location fix
vim.keymap.set("n", "co", ":copen<cr>", opts)
vim.keymap.set("n", "cj", ":cnext<cr>", opts)
vim.keymap.set("n", "ck", ":cprevious<cr>", opts)
vim.keymap.set("n", "cc", ":cclose<cr>", opts)

vim.keymap.set("n", "zo", ":lopen<cr>", opts)
vim.keymap.set("n", "zj", ":lnext<cr>", opts)
vim.keymap.set("n", "zk", ":lprevious<cr>", opts)
vim.keymap.set("n", "Q", ":q!<enter>", opts)
vim.keymap.set("v", "Y", '"+y', opts)
vim.keymap.set("n", "<", "<<", opts)
vim.keymap.set("n", ">", ">>", opts)
vim.keymap.set("n", "<leader>o", "za", opts)

vim.keymap.set("n", "zc", ":lclose<cr>", opts)

-- hop cmd
vim.keymap.set("n", "<leader><leader>s", ":HopWord<cr>")
vim.keymap.set("n", "<leader><leader>S", ":HopWordMW<cr>")
vim.keymap.set("n", "<leader><leader>f", ":HopChar2<cr>")
vim.keymap.set("n", "<leader><leader>F", ":HopChar2MW<cr>")
vim.keymap.set("n", "<leader>hl", ":HopLine<cr>")
vim.keymap.set("n", "<leader>hls", ":HopLineStart<cr>")

--telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>th", builtin.search_history, {})
vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
-- telescope git commands
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
vim.keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", {}) -- mapping to restart lsp if necessary

-- troubles
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })
-- vim-maximizer
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

--nvim-treesitter 代码格式化
vim.keymap.set("n", "<leader>i", "gg=G", opt)

local map = vim.api.nvim_set_keymap

-- switch between source and header
map("n", "<F2>", "<Cmd>SwitchSourceAndHeader<CR>", opts)
-- generate the function definition or static variable definition in source
map("n", "<leader>cf", "<Cmd>ImplementInSource<CR>", opts)
-- generate the function definition or static variable definition in source in visual mode
map("v", "<leader>cf", '<Cmd>lua require("cppassist").ImplementInSourceInVisualMode<CR>', opts)
-- generate the function definition or static variable definition in header
map("n", "<leader>cv", "<Cmd>ImplementOutOfClass<CR>", opts)
-- goto the header file
map("n", "<leader>gh", "<Cmd>GotoHeaderFile<CR>", opts)
--文件大纲
map("n", "T", "<cmd>AerialToggle<CR>", opts)
--session
map("n", "<leader>sp", "<cmd>SessionManager load_session<cr>", opts)

-- debug
map(
  "n",
  "<leader>db",
  "<cmd>lua require'dap'.toggle_breakpoint(); require'user.dap.dap-util'.store_breakpoints(true)<cr>",
  opts
)
map("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
-- map("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
map("n", "<F9>", "<cmd>lua require'dap'.run_last()<cr>", opts)
map("n", "<F10>", '<cmd>lua require"user.dap.dap-util".reload_continue()<CR>', opts)
map("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
map("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
map("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
map("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
map("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
map("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opts)
-- map("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- map("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", opts)


map("n","U",":UndotreeToggle<cr>",opts)
