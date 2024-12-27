return {
  "tidalcycles/vim-tidal",
  config = function()
    vim.cmd([[ let g:tidal_target = "terminal" ]])
  end,
}
