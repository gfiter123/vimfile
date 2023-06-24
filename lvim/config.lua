--[[
lvim is the global options object
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

local home = os.getenv("HOME")
package.path = home .. "/vimfile/lvim/?.lua"

-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar"
-- themes: https://vimcolorschemes.com/
-- lvim.colorscheme = "gruvbox"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

--  options
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.relativenumber = true
--设置空格为小框，tab为三角号
vim.opt.listchars = {
	tab = "▸ ",
	trail = "▫",
}

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["E"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["R"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["H"] = "^"
lvim.keys.normal_mode["L"] = "$"
lvim.keys.normal_mode["Q"] = ":q!<enter>"
lvim.keys.normal_mode["<leader>h"] = ":nohl<cr>"
lvim.keys.normal_mode["<leader>j"] = ":ClangdSwitchSourceHeader<cr>"
lvim.keys.normal_mode["<leader>H"] = ":ClangdTypeHierarchy<cr>"
lvim.keys.normal_mode["T"] = ":Vista!!<cr>"
lvim.keys.normal_mode["<leader>q"] = ":bd<cr>"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
lvim.keys.normal_mode["J"] = "5j"
-- lvim.keys.normal_mode["K"] = "5K"
lvim.keys.normal_mode["gb"] = "<Cmd>BufferLinePick<CR>"
--toggleterm
-- lvim.keys.normal_mode["<M-1>"] = { "<cmd>ToggleTerm direction=horizontal<CR>" }
-- lvim.keys.normal_mode["<M-2>"] = { "<cmd>ToggleTerm direction=vertical<CR>" }
-- lvim.keys.normal_mode["<M-3>"] = { "<cmd>ToggleTerm fdirection=float<CR>" }

lvim.keys.normal_mode["<leader>1"] = "<Cmd>BufferLineGoToBuffer 1<CR>"
lvim.keys.normal_mode["<leader>2"] = "<Cmd>BufferLineGoToBuffer 2<CR>"
lvim.keys.normal_mode["<leader>3"] = "<Cmd>BufferLineGoToBuffer 3<CR>"
lvim.keys.normal_mode["<leader>4"] = "<Cmd>BufferLineGoToBuffer 4<CR>"
lvim.keys.normal_mode["<leader>5"] = "<Cmd>BufferLineGoToBuffer 5<CR>"
lvim.keys.normal_mode["<leader>6"] = "<Cmd>BufferLineGoToBuffer 6<CR>"
lvim.keys.normal_mode["<leader>7"] = "<Cmd>BufferLineGoToBuffer 7<CR>"
lvim.keys.normal_mode["<leader>8"] = "<Cmd>BufferLineGoToBuffer 8<CR>"
lvim.keys.normal_mode["<leader>9"] = "<Cmd>BufferLineGoToBuffer 9<CR>"

lvim.keys.visual_mode["p"] = "P"
lvim.keys.visual_mode["H"] = "^"
lvim.keys.visual_mode["L"] = "$"
lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"

-- lsp
lvim.keys.normal_mode["<leader>in"] = ":lua vim.lsp.buf.incoming_calls()<cr>"
lvim.keys.visual_mode["<leader>lf"] = "<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>"
lvim.keys.normal_mode["<leader>ln"] = "<cmd>lua vim.lsp.buf.rename()<CR>"
-- telescope
lvim.keys.normal_mode["<leader>r"] = ":Telescope oldfiles<cr>"

-- orverwirte old 's'
-- lvim.builtin.which_key.mappings.f   = nil
-- lvim.builtin.which_key.mappings.s   = nil
lvim.keys.normal_mode["<leader>s"] = ":lua require('telescope.builtin').lsp_document_symbols()<cr>"
lvim.keys.normal_mode["<leader>S"] = ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>"
lvim.keys.normal_mode["<leader>ff"] = ":lua require('lvim.core.telescope.custom-finders').find_project_files()<cr>"
lvim.keys.normal_mode["<leader>fe"] = ":lua require('my_funcs').live_grep_raw({default_text =''})<cr>"
lvim.keys.visual_mode["<leader>fw"] = "<Esc>:lua require('my_funcs').live_grep_raw({}, 'v')<cr>"
lvim.keys.normal_mode["<leader>fw"] =
	":lua require('my_funcs').live_grep_raw({default_text = vim.fn.expand('<cword>')})<cr>"
lvim.keys.normal_mode["<leader>fd"] =
	":lua require('my_funcs').live_grep_raw({default_text =  '-g' .. vim.fn.fnamemodify(vim.fn.expand('%'), ':.:h') .. '/*' .. ' ' .. vim.fn.expand('<cword>')})<cr>"
lvim.keys.normal_mode["<leader>k"] = "<cmd>Telescope keymaps<cr>"

-- hop
lvim.keys.visual_mode["f"] =
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false})<cr>"
lvim.keys.visual_mode["F"] =
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
lvim.keys.normal_mode["f"] =
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false})<cr>"
lvim.keys.normal_mode["F"] =
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
lvim.keys.normal_mode["<leader><leader>w"] = "<cmd>HopChar2<cr>"
lvim.keys.normal_mode["<leader><leader>s"] = ":HopWord<cr>"
-- yank history
lvim.keys.normal_mode["<leader>yh"] = "<cmd>Telescope neoclip<cr>"

-- auto pairs
lvim.builtin.autopairs.disable_filetype = { "TelescopePrompt", "spectre_panel", "repl" }

-- dap
lvim.keys.normal_mode["<F12>"] = ":Telescope dap configurations<cr>"
lvim.builtin.which_key.mappings.d = {
	name = "Debug",
	h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
	x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
	t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
	b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
	c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
	C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
	d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
	g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
	i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
	o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
	u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
	p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
	r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
	s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
	q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
	U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
}

-- unmap a default keymapping
-- vim.keymap.del("n", "q")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
	-- for input mode
	i = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<C-n>"] = actions.cycle_history_next,
		["<C-p>"] = actions.cycle_history_prev,
	},
	-- for normal mode
	n = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
	},
}

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.plugins = {
  marks = true, -- shows a list of your marks on ' and `
  registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
  -- the presets plugin, adds help for a bunch of default keybindings in Neovim
  -- No actual key bindings are created
  spelling = {
    enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
    suggestions = 20, -- how many suggestions should be shown in the list?
  },
  presets = {
    operators = true, -- adds help for operators like d, y, ...
    motions = true, -- adds help for motions
    text_objects = true, -- help for text objects triggered after entering an operator
    windows = true, -- default bindings on <c-w>
    nav = true, -- misc bindings to work with windows
    z = true, -- bindings for folds, spelling and others prefixed with z
    g = true, -- bindings for prefixed with g
  },
}
-- add operators that will trigger motion and text object completion
-- to enable all native operators, set the preset / operators plugin above
lvim.builtin.which_key.operators = { gc = "Comments" }
lvim.builtin.which_key.key_labels = {
  -- override the label used to display some keys. It doesn't effect WK in any other way.
  -- For example:
  -- ["<space>"] = "SPC",
  -- ["<cr>"] = "RET",
  -- ["<tab>"] = "TAB",
}
lvim.builtin.which_key.motions = {
  count = true,
}
lvim.builtin.which_key.icons = {
  breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
  separator = "➜", -- symbol used between a key and it's label
  group = "+", -- symbol prepended to a group
}
lvim.builtin.which_key.popup_mappings = {
  scroll_down = "<c-d>", -- binding to scroll down inside the popup
  scroll_up = "<c-u>", -- binding to scroll up inside the popup
}
lvim.builtin.which_key.window = {
  border = "none", -- none, single, double, shadow
  position = "bottom", -- bottom, top
  margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
  padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
  winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
  zindex = 1000, -- positive value to position WhichKey above other floating windows.
}
lvim.builtin.which_key.layout = {
  height = { min = 4, max = 25 }, -- min and max height of the columns
  width = { min = 20, max = 50 }, -- min and max width of the columns
  spacing = 3, -- spacing between columns
  align = "left", -- align columns left, center or right
}
lvim.builtin.which_key.ignore_missing = true -- enable this to hide mappings for which you didn't specify a label
lvim.builtin.which_key.hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " } -- hide mapping boilerplate
lvim.builtin.which_key.show_help = true -- show a help message in the command line for using WhichKey
lvim.builtin.which_key.show_keys = true -- show the currently pressed key and its label as a message in the command line
lvim.builtin.which_key.triggers = "auto" -- automatically setup triggers
-- triggers = {"<leader>"} -- or specifiy a list manually
-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
lvim.builtin.which_key.triggers_nowait = {
  -- marks
  "`",
  "'",
  "g`",
  "g'",
  -- registers
  '"',
  "<c-r>",
  -- spelling
  "z=",
}
lvim.builtin.which_key.triggers_blacklist = {
  -- list of mode / prefixes that should never be hooked by WhichKey
  -- this is mostly relevant for keymaps that start with a native binding
  i = { "j", "k" },
  v = { "j", "k" },
}
-- disable the WhichKey popup for certain buf types and file types.
-- Disabled by default for Telescope
lvim.builtin.which_key.disable = {
  buftypes = {},
  filetypes = {},
}
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
	t = { "<cmd>TodoTrouble<cr>", "Todo" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
-- nvim tree
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.adaptive_size = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
-- cmp
lvim.builtin.cmp.cmdline.enable = true
table.insert(lvim.builtin.cmp.sources, {
	name = "nvim_lsp_signature_help",
})

-- gitsigns
lvim.builtin.gitsigns.opts.current_line_blame = false
lvim.builtin.gitsigns.opts.current_line_blame_opts.virt_text_pos = "right_align"
lvim.builtin.gitsigns.opts.current_line_blame_opts.delay = 200
-- buffer line
lvim.builtin.bufferline.highlights.buffer_selected = {
	bold = true,
	fg = "#ffd43b",
}


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"cpp",
	"json",
	"lua",
	"python",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
	"clangd",
	"pyright",
}

-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = false
-- disable diagnostics which is super annoying in my case
vim.diagnostic.config({ virtual_text = false })
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
--
---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright", "clangd" })
require("lvim.lsp.manager").setup("pyright", {
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "off",
				autoImportCompletions = true,
			},
		},
	},
})

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "pylsp"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
-- require "lsp_signature".on_attach()
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "black", filetypes = { "python" } },
	-- { command = "isort", filetypes = { "python" } },
	-- {
	--   -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
	--   command = "prettier",
	--   ---@usage arguments to pass to the formatter
	--   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
	--   extra_args = { "--print-with", "100" },
	--   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
	--   filetypes = { "typescript", "typescriptreact" },
	-- },
})

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   -- { command = "flake8", filetypes = { "python" } },
--   -- {
--   --   -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--   --   command = "shellcheck",
--   --   ---@usage arguments to pass to the formatter
--   --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--   --   extra_args = { "--severity", "warning" },
--   -- },
--   {
--     command = "cpplint",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "c", "cpp" },
--   },
-- }

lvim.lsp.null_ls.setup.on_init = function(new_client, _)
	new_client.offset_encoding = "utf-16"
end

-- Additional Plugins
lvim.plugins = {
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{ -- better quick fix
		"kevinhwang91/nvim-bqf",
		config = function()
			require("bqf").setup({
				func_map = {
					pscrollup = "<C-u>",
					pscrolldown = "<C-d>",
				},
			})
		end,
	},
	{ -- only works on https://github.com/universal-ctags/ctags
		"liuchengxu/vista.vim",
		config = function()
			vim.cmd([[ 
      " let g:vista_sidebar_position = 'vertical topleft' 
      let g:vista_sidebar_position = 'vertical botright' 
      let g:vista_sidebar_width = '50' 
      let g:vista_default_executive = 'nvim_lsp' 
      ]])
		end,
	},
	{ -- telescope instant searching
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	{
		"ldelossa/litee.nvim",
		config = function()
			require("litee.lib").setup({})
		end,
	},
	{ -- calltree
		"ldelossa/litee-calltree.nvim",
		config = function()
			require("litee.calltree").setup({
				-- NOTE: the plugin is in-progressing
				on_open = "pannel", -- pannel | popout
				hide_cursor = false,
				keymaps = {
					expand = "o",
					collapse = "zc",
					collapse_all = "zM",
					jump = "<CR>",
					jump_split = "s",
					jump_vsplit = "v",
					jump_tab = "t",
					hover = "i",
					details = "d",
					close = "X",
					close_panel_pop_out = "<C-c>",
					help = "?",
					hide = "H",
					switch = "S",
					focus = "f",
				},
			})
		end,
	},
	{
		"NLKNguyen/papercolor-theme",
	},
	{ -- hop
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},
	{ -- resize window
		"simeji/winresizer",
	},
	{ -- vim clip on server
		"wincent/vim-clipper",
		config = function()
			vim.cmd([[
      let g:ClipperAddress="127.0.0.1"
      let g:ClipperPort=8377
      let g:ClipperAuto=1
      call clipper#set_invocation('netcat -c 127.0.0.1 8377')
    ]])
		end,
	},
	{ -- log file content highlighting
		"mtdl9/vim-log-highlighting",
	},
	{
		"tpope/vim-surround",
	},
	{ -- theme
		"morhetz/gruvbox",
	},
	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
	{ -- auto save
		"pocco81/auto-save.nvim",
	},
	{
		"p00f/clangd_extensions.nvim",
		after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
		config = function()
			local provider = "clangd"
			local clangd_flags = {
				-- 在后台自动分析文件（基于complie_commands)
				"--compile-commands-dir=build",
				"--background-index",
				"--completion-style=detailed",
				-- 同时开启的任务数量
				"--all-scopes-completion=true",
				"--recovery-ast",
				"--suggest-missing-includes",
				-- 告诉clangd用那个clang进行编译，路径参考which clang++的路径
				"--query-driver=/usr/locla/bin/clang++,/usr/bin/g++",
				"--clang-tidy",
				-- 全局补全（会自动补充头文件）
				"--all-scopes-completion",
				"--cross-file-rename",
				-- 更详细的补全内容
				"--completion-style=detailed",
				"--function-arg-placeholders=false",
				-- 补充头文件的形式
				"--header-insertion=never",
				-- pch优化的位置
				"--pch-storage=memory",
				"--offset-encoding=utf-16",
				"-j=12",
			}

			local custom_on_attach = function(client, bufnr)
				require("lvim.lsp").common_on_attach(client, bufnr)
				require("clangd_extensions.inlay_hints").setup_autocmd()
				require("clangd_extensions.inlay_hints").set_inlay_hints()
			end

			local custom_on_init = function(client, bufnr)
				require("lvim.lsp").common_on_init(client, bufnr)
				require("clangd_extensions.config").setup({})
				require("clangd_extensions.ast").init()
				vim.cmd([[
              command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
              command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
              command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
              command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
              command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
              ]])
			end

			local opts = {
				cmd = { provider, unpack(clangd_flags) },
				on_attach = custom_on_attach,
				on_init = custom_on_init,
			}

			require("lvim.lsp.manager").setup("clangd", opts)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		commit = "c81382328ad47c154261d1528d7c921acad5eae5",
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							-- You can optionally set descriptions to the mappings (used in the desc parameter of
							-- nvim_buf_set_keymap) which plugins like which-key display
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						},
						-- You can choose the select mode (default is charwise 'v')
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * method: eg 'v' or 'o'
						-- and should return the mode ('v', 'V', or '<c-v>') or a table
						-- mapping query_strings to modes.
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
						-- If you set this to `true` (default is `false`) then any textobject is
						-- extended to include preceding or succeeding whitespace. Succeeding
						-- whitespace has priority in order to act similarly to eg the built-in
						-- `ap`.
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * selection_mode: eg 'v'
						-- and should return true of false
						include_surrounding_whitespace = true,
					},
					move = {
						enable = true,
						set_jumps = false, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]]"] = "@function.outer",
							-- ["]["] = "@function.outer",
						},
						goto_next_end = {
							["]["] = "@function.outer",
							-- ["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[["] = "@function.outer",
							-- ["[]"] = "@function.outer",
						},
						goto_previous_end = {
							["[]"] = "@function.outer",
							-- ["[]"] = "@class.outer",
						},
					},
					lsp_interop = {
						enable = true,
						border = "none",
						peek_definition_code = {
							["<leader>pf"] = "@function.outer",
							["<leader>pF"] = "@class.outer",
						},
					},
				},
			})
		end,
	},
	{
		"AckslD/nvim-neoclip.lua",
		config = function()
			require("neoclip").setup({
				keys = {
					telescope = {
						i = {
							select = "<cr>",
							paste = "<c-p>",
							paste_behind = "<c-P>",
							replay = "<c-q>", -- replay a macro
							delete = "<c-d>", -- delete an entry
							custom = {},
						},
						n = {
							select = "<cr>",
							paste = "p",
							--- It is possible to map to more than one key.
							-- paste = { 'p', '<c-p>' },
							paste_behind = "P",
							replay = "q",
							delete = "d",
							custom = {},
						},
					},
				},
			})
			require("telescope").load_extension("neoclip")
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp-signature-help",
	},
	{
    "ethanholz/nvim-lastplace",
    config = function()

      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true,
      })
    end,
	},
	-- { -- json parser for dap launch.json
	--   -- NOTE: cargo required: https://rustup.rs/
	--   'Joakker/lua-json5',
	--   run = './install.sh'
	-- },
	{
		"nvim-telescope/telescope-dap.nvim",
		config = function()
			require("telescope").load_extension("dap")
		end,
	},
  {
  "AndrewRadev/switch.vim",
  cmd = "Switch",
    -- stylua: ignore
    keys = {
      { ";s", "<cmd>Switch<CR>" },
    },
  config = function()
    -- 反义单词组
    local switch_words = {
      { "true", "false" },
      { "on", "off" },
      { "yes", "no" },
      { "disable", "enable" },
      { "+", "-" },
      { ">", "<" },
      { ">=", "<=" },
      { "==", "!=" },
      { "&&", "||" },
    }

    -- 反义单词容器
    local push_words = {}

    for _, value in pairs(switch_words) do
      local w1, w2 = value[1], value[2]
      -- 全小写
      table.insert(push_words, value)
      -- 全大写
      table.insert(push_words, { string.upper(w1), string.upper(w2) })
      -- 首字母大写
      w1, _ = string.gsub(w1, "^%l", string.upper)
      w2, _ = string.gsub(w2, "^%l", string.upper)
      table.insert(push_words, { w1, w2 })
    end

    vim.g.switch_custom_definitions = push_words
  end,
  },
}

--- dap config
-- load non-standard json file
-- require('dap.ext.vscode').json_decode = require 'json5'.parse
-- require('dap.ext.vscode').load_launchjs()
-- require("dap.dap-lldb")
-- require("dap.dap-cppdbg")

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	command = "set tabstop=2  shiftwidth=2",
})
-- 补全增强
vim.o.wildmenu = true
