return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { mode = "n", "<C-p>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
  },
  opts = {
    view = {
      width = "15%",
      side = "left",
    },
  },
}
