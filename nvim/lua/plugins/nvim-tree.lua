local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
  vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
  vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
  vim.keymap.set("n", "P", function()
    local node = api.tree.get_node_under_cursor()
    print(node.absolute_path)
  end, opts("Print Node Path"))

  vim.keymap.set("n", "Z", api.node.run.system, opts("Run System"))
end
-- configure nvim-tree
nvimtree.setup({
  on_attach = on_attach,
  -- change folder arrow icons
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
        },
      },
    },
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  -- 	git = {
  -- 		ignore = false,
  -- 	},
})

vim.keymap.set("n", "tt", ":NvimTreeToggle<cr>", {})
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", {})
vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<cr>", {})
