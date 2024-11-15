return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    opts = {
      -- key to open multiple terminals.
      -- "<number><C-\>" in normal mode to open a new terminal.
      open_mapping = "<C-\\>",
    },
    keys = {
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "ToggleTerm Horizontal" },
      { "<leader>tv", "<cmd>ToggleTerm size=40 direction=vertical<cr>", desc = "ToggleTerm Vertical" },
      { "<leader>tt", "<cmd>ToggleTerm direction=tab<cr>", desc = "ToggleTerm Tab" },
      { "<leader>tf", "<cmd>ToggleTerm direction=tab<cr>", desc = "ToggleTerm Float" },
    }
  }
}
