return {
  {
    -- 高度显示当前搜索的计数
    "kevinhwang91/nvim-hlslens",
    keys = {
      { "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], desc = "next" },
      { "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], desc = "prev" },
      { "*", [[*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true } },
      { "#", [[#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true } },
      { "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true } },
      { "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true } },
    },
  },
  {
    -- 显示marks
    "chentoast/marks.nvim",
    event = { "BufReadPost" },
    keys = {
      { "m/", "<cmd>MarksListAll", { noremap = true, silent = true } },
    },
    opts = {
      -- whether to map keybinds or not. default true
      default_mappings = true,
      -- which builtin marks to show. default {}
      builtin_marks = { ".", "<", ">", "^" },
      -- whether movements cycle back to the beginning/end of buffer. default true
      cyclic = true,
      -- whether the shada file is updated after modifying uppercase marks. default false
      force_write_shada = false,
      -- how often (in ms) to redraw signs/recompute mark positions.
      -- higher values will have better performance but may cause visual lag,
      -- while lower values may cause performance penalties. default 150.
      refresh_interval = 250,
      -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
      -- marks, and bookmarks.
      -- can be either a table with all/none of the keys, or a single number, in which case
      -- the priority applies to all marks.
      -- default 10.
      sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
      -- disables mark tracking for specific filetypes. default {}
      excluded_filetypes = {},
      -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
      -- sign/virttext. Bookmarks can be used to group together positions and quickly move
      -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
      -- default virt_text is "".
      bookmark_0 = {
        sign = "⚑",
        virt_text = "hello world",
        -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
        -- defaults to false.
        annotate = false,
      },
      mappings = {},
      -- mx=Set mark x
      -- m,=Set the next available alphabetical (lowercase) mark
      -- m;              Toggle the next available mark at the current line
      -- dmx             Delete mark x
      -- dm-             Delete all marks on the current line
      -- dm<space>       Delete all marks in the current buffer
      -- m]              Move to next mark
      -- m[              Move to previous mark
      -- m:              Preview mark. This will prompt you for a specific mark to
      --                 preview; press <cr> to preview the next mark.

      -- m[0-9]          Add a bookmark from bookmark group[0-9].
      -- dm[0-9]         Delete all bookmarks from bookmark group[0-9].
      -- m}              Move to the next bookmark having the same type as the bookmark under
      --                 the cursor. Works across buffers.
      -- m{              Move to the previous bookmark having the same type as the bookmark under
      --                 the cursor. Works across buffers.
      -- dm=             Delete the bookmark under the cursor.
    },
  },
  {
    "Shatur/neovim-session-manager",
    event = "VeryLazy",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    keys = {
      { "<leader>qo", "<cmd>SessionManager load_session<cr>", desc = "open_session" },
    },
    config = function()
      require("session_manager").setup({
        sessions_dir = require("plenary.path"):new(vim.fn.stdpath("data"), "sessions"), -- The directory where the session files will be saved.
        path_replacer = "__", -- The character to which the path separator will be replaced for session files.
        colon_replacer = "++", -- The character to which the colon symbol will be replaced for session files.
        autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
        autosave_last_session = true, -- Automatically save last session on exit and on session switch.
        autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
        autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
          "gitcommit",
        },
        autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
        max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
      })
    end,
  },
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
      local button = dashboard.button("o", " " .. "Open Session", "<cmd>SessionManager load_session<cr>")
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 4, button)
    end,
  },
  {
    "echasnovski/mini.starter",
    optional = true,
    opts = function(_, opts)
      local items = {
        {
          name = "Session",
          action = "SessionManager load_session",
        },
      }
      vim.list_extend(opts.items, items)
    end,
  },
  {
    "code-biscuits/nvim-biscuits", -- AST enhance 大括号提示, require treesitter
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
      },
    },
    event = { "BufReadPost", "InsertLeave" },
    opts = {
      toggle_keybind = "<leader>ub",
      show_on_start = false, -- defaults to false
      cursor_line_only = true,
      default_config = {
        max_length = 12,
        min_distance = 5,
        prefix_string = " ✨ ",
      },
      language_config = {
        -- cpp = {
        --   prefix_string = " // "
        -- },
        -- javascript = {
        --   prefix_string = " ✨ ",
        --   max_length = 80
        -- },
        python = {
          disabled = true,
        },
      },
    },
  },
  {
    "Pocco81/HighStr.nvim",
    event = { "BufReadPost", "InsertLeave" },
    config = function()
      require("high-str").setup({
        verbosity = 0,
        saving_path = "/tmp/highstr/",
        highlight_colors = {
          -- color_id = {"bg_hex_code",<"fg_hex_code"/"smart">}
          color_0 = { "#0c0d0e", "smart" }, -- Cosmic charcoal
          color_1 = { "#e5c07b", "smart" }, -- Pastel yellow
          color_2 = { "#7FFFD4", "smart" }, -- Aqua menthe
          color_3 = { "#8A2BE2", "smart" }, -- Proton purple
          color_4 = { "#FF4500", "smart" }, -- Orange red
          color_5 = { "#008000", "smart" }, -- Office green
          color_6 = { "#0000FF", "smart" }, -- Just blue
          color_7 = { "#FFC0CB", "smart" }, -- Blush pink
          color_8 = { "#FFF9E3", "smart" }, -- Cosmic latte
          color_9 = { "#7d5c34", "smart" }, -- Fallow brown
        },
      })
    end,
  },
  {
    "m-demare/hlargs.nvim",
    event = { "BufReadPost", "InsertLeave" },
    config = function()
      require("hlargs").setup()
    end
  },
}
