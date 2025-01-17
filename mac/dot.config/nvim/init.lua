local opt = vim.opt

-- share clipboard
vim.opt.clipboard:append({ "unnamedplus" })

-- show line number
opt.number = true

-- indent
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- filetype specific indent setting
local filetype_tabstop = { wgsl = 4 }
local usrftcfg = vim.api.nvim_create_augroup("UserFileTypeConfig", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = usrftcfg,
  callback = function(args)
    local ftts = filetype_tabstop[args.match]
    if ftts then
      vim.bo.tabstop = ftts
      vim.bo.softtabstop = ftts
      vim.bo.shiftwidth = ftts
    end
  end,
})

-- use spaces for tabs
opt.expandtab = true

-- highlight cursor line
opt.cursorline = true

-- disable netrw
vim.api.nvim_set_var("loaded_netrw", 1)
vim.api.nvim_set_var("loaded_netrwPlugin", 1)

-- keymap
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader><Tab>", "<C-^>", { noremap = true })

-- let <ESC> quit terminal mode
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true })

-- continue selecting area after changing indentation in visual mode
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })

-- Shift-Tab to tab backwards
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true })

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.keymap.set("n", "<ESC><ESC>", "<cmd>nohlsearch<CR>", { noremap = true })

-- auto format when saving
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

require("config.lazy")

vim.cmd([[colorscheme tokyonight]])
