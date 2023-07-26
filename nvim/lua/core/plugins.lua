-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  --加速启动
  use("lewis6991/impatient.nvim") -- Speed up loading Lua modules    TODO: figure out how to use this
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  use("rcarriga/nvim-notify") -- notify
  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
  use({ "akinsho/bufferline.nvim" })
  use({ "nvim-lua/popup.nvim" }) -- An implementation of the Popup API from vim in Neovim

  use("folke/tokyonight.nvim") -- preferred colorscheme

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  -- essential plugins
  use("tpope/vim-repeat") --  . command enhance
  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  -- commenting with gc
  use("numToStr/Comment.nvim")
  use("folke/todo-comments.nvim") -- todo comments
  use("ahmedkhalf/project.nvim") -- project manager
  use({ "lukas-reineke/indent-blankline.nvim" })


  -- use({ "BurntSushi/ripgrep" }) --requires
  -- use({ "p00f/nvim-ts-rainbow" })

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- vs-code like icons
  use("nvim-tree/nvim-web-devicons")

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
  use({
    "nvim-telescope/telescope-live-grep-args.nvim",
  })
  use("nvim-telescope/telescope-ui-select.nvim")
  use("nvim-telescope/telescope-rg.nvim")
  use("nvim-telescope/telescope-dap.nvim")
  --
  --
  --
  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths
  use("hrsh7th/cmp-cmdline") -- source for file system paths
  use("hrsh7th/cmp-nvim-lsp") -- source for file system paths
  use("hrsh7th/cmp-nvim-lua") -- source for file system paths
  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/vim-vsnip")
  -- use "f3fora/cmp-spell" -- spell check
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  use("nvim-pack/nvim-spectre") -- search and replace pane

  -- hop.nvim
  use({ "phaazon/hop.nvim", branch = "v2" }) --rv2' optional but strongly recommended
  --
  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup({})
    end,
  }) -- enhanced lsp uis
  use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
  use("simrat39/rust-tools.nvim") -- rust server

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
  }) -- enhance texetobject selection
  use("romgrk/nvim-treesitter-context") -- show class/function at the top

  use("kosayoda/nvim-lightbulb") -- code action
  use("ray-x/lsp_signature.nvim") -- show function signature when typing
  -- themes
  -- use({
  --   "sainnhe/gruvbox-material",
  --   "ellisonleao/gruvbox.nvim",
  --   "joshdick/onedark.vim",
  --   "Rigellute/shades-of-purple.vim",
  --   "rebelot/kanagawa.nvim",
  --   "sainnhe/everforest",
  --   "catppuccin/nvim",
  --   "folke/tokyonight.nvim",
  --
  -- })

  -- UI
  use({ "goolord/alpha-nvim" })
  -- use({ "folke/noice.nvim" })
  -- use({ "rcarriga/nvim-notify" })
  -- use({ "petertriho/nvim-scrollbar" })
  use({ "j-hui/fidget.nvim" }) --show lsp loading
  -- use({ "MunifTanjim/nui.nvim" })
  use("szw/vim-maximizer") -- maximizes and restores current window
  use({ "NvChad/nvim-colorizer.lua" }) --show color
  use("code-biscuits/nvim-biscuits") -- AST enhance 大括号提示, require treesitter
  -- use({ "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" }) --在状态栏显示当前class，struct
  use({ "kevinhwang91/nvim-hlslens" }) --高亮搜索，显示总数

  --like tmux
  -- toggle term
  use({ "akinsho/toggleterm.nvim", tag = "*" })

  use("wincent/vim-clipper") --远程剪切板
  -- use("AckslD/nvim-neoclip.lua")   --历史剪切板
  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
  -- markdown
  use({ "godlygeek/tabular", ft = { "markdown" } }) -- requires
  use({ "plasticboy/vim-markdown", ft = { "markdown" } })
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })

  use({ "ferrine/md-img-paste.vim" })
  use({ "dhruvasagar/vim-table-mode" })

  use({ "mbbill/undotree" })

  use({ "lervag/vimtex" })

  use({ "mg979/vim-visual-multi" })

  use({ "chentoast/marks.nvim" })

  use({ "stevearc/aerial.nvim" })

  -- markdown preview
  --use({
  --"iamcco/markdown-preview.nvim",
  --run = "cd app && npm install",
  --setup = function()
  --vim.g.mkdp_filetypes = { "markdown" }
  --end,
  --ft = { "markdown" },
  --})

  --cpp 函数生成，源/头文件跳转
  use({ "Kohirus/cppassist.nvim" })
  --opt = true,
  --ft = { "h", "cpp", "hpp", "c", "cc", "cxx" },

  --})
  use({ "Shatur/neovim-session-manager" })

  use("folke/which-key.nvim") -- which  key
  --DAP
  use("ravenxrz/DAPInstall.nvim") -- help us install several debuggers
  use({
    "ravenxrz/nvim-dap",
    -- commit = "f9480362549e2b50a8616fe4530deaabbc4f889b",
  })
  use("theHamsta/nvim-dap-virtual-text") --在源码右边显示变量值
  use("rcarriga/nvim-dap-ui") --窗口
  -- use "mfussenegger/nvim-dap-python"    -- debug python
  -- use { "leoluz/nvim-dap-go", module = "dap-go" } -- debug golang
  -- use({ "jbyuki/one-small-step-for-vimkind", module = "osv" }) -- debug any Lua code running in a Neovim instance
  use({
    "ravenxrz/nvim-gdb",
    run = "./install.sh",
  })

  use("sindrets/diffview.nvim")

  -- litee family
  use({
    "ldelossa/litee.nvim",
  })
  use({
    "ldelossa/litee-calltree.nvim",
  })

  use("ravenxrz/neovim-cmake")

  use("voldikss/vim-translator")
  use("mtdl9/vim-log-highlighting")
  use("Pocco81/HighStr.nvim")

  use("ravenxrz/vim-local-history")

  use("vim-test/vim-test")
  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
    },
  })
  use({ "michaelb/sniprun", run = "bash ./install.sh" })
  use("ravenxrz/DoxygenToolkit.vim")
  use("Pocco81/auto-save.nvim")
  use("djoshea/vim-autoread")

  -- use "chipsenkbeil/distant.nvim"

  if packer_bootstrap then
    require("packer").sync()
  end
end)
