return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      render_modes = true,
      heading = {
        icons = {},
      },
    },
  },
  {
    "ixru/nvim-markdown",
    config = function()
      vim.cmd([[ map <Plug> <Plug>Markdown_Fold ]])
    end,
  },
}
