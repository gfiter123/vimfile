return {
  {
    "gifter123/cscope_maps.nvim",
    enabled = true,
    lazy = true,
    ft = { "h", "cpp", "hpp", "c", "cc", "java" },
    dependencies = {
      "folke/which-key.nvim", -- optional [for whichkey hints]
      "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
      "ibhagwan/fzf-lua", -- optional [for picker="fzf-lua"]
      "nvim-tree/nvim-web-devicons", -- optional [for devicons in telescope or fzf]
    },
    opts = {
      -- USE EMPTY FOR DEFAULT OPTIONS
      -- DEFAULTS ARE LISTED BELOW
      -- maps related defaults
      disable_maps = false, -- "true" disables default keymaps
      skip_input_prompt = false, -- "true" doesn't ask for input

      -- cscope related defaults
      cscope = {
        -- location of cscope db file
        db_file = "./cscope.out",
        -- cscope executable
        exec = "cscope", -- "cscope" or "gtags-cscope"
        -- choose your fav picker
        picker = "quickfix", -- "telescope", "fzf-lua" or "quickfix"
        -- "true" does not open picker for single result, just JUMP
        skip_picker_for_single_result = false, -- "false" or "true"
        -- these args are directly passed to "cscope -f <db_file> <args>"
        db_build_cmd_args = { "-bqkv" },
        -- statusline indicator, default is cscope executable
        statusline_indicator = nil,
      },
    },
  },
  {
    "dhananjaylatkar/vim-gutentags",
    enabled = true,
    -- lazy = true,
    -- ft = { "h", "cpp", "hpp", "c", "cc", "java" },

    dependencies = { "cscope_maps.nvim" },
    config = function()
      vim.g.gutentags_project_root = { ".root", ".svn", ".git", ".project" }
      vim.g.gutentags_ctags_tagfile = ".tags"
      vim.g.gutentags_modules = { "ctags", "cscope_maps" } -- This is required. Other config is optional
      vim.g.gutentags_cscope_build_inverted_index_maps = 1
      vim.g.xh_vim_tags = vim.fn.expand("~/.cache/tags")
      vim.cmd([[

          if !isdirectory(g:xh_vim_tags)
            silent! call mkdir(g:xh_vim_tags, 'p')
          endif

      ]])
      vim.g.gutentags_cache_dir = vim.g.xh_vim_tags
      -- vim.g.gutentags_file_list_command = "fd -e c -e h"
      vim.g.gutentags_ctags_extra_args = { "--fields=+niazS", "--extra=+q", "--c++-kinds=+pxI", "--c-kinds=+px" }
      vim.g.gutentags_define_advanced_commands = 1
      -- vim.g.gutentags_trace = 1
    end,
  },
}
