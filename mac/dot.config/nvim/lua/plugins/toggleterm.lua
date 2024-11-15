return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    keys = {
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "ToggleTerm Horizontal" },
      { "<leader>tv", "<cmd>ToggleTerm size=40 direction=vertical<cr>", desc = "ToggleTerm Vertical" },
    }
  }
}
