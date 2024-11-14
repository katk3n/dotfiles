return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "BufEnter",
  dependencies = "nvim-tree/nvim-web-devicons",
  keys = {
    { mode = "n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
    { mode = "n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous Buffer" },
  },
  opts = {
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          separator = true,
          text_align = "left",
          highlight = "Directory",
        }
      },
    },
  },
}
