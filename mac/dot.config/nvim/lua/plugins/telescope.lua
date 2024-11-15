return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { mode = "n", "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope find files" },
    { mode = "n", "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Telescope live grep" },
    { mode = "n", "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Telescope buffers" },
    { mode = "n", "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Telescope help tags" },
  },
}