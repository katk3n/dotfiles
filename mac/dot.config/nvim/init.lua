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

-- use spaces for tabs
opt.expandtab = true

-- highlight cursor line
opt.cursorline = true

-- disable netrw
vim.api.nvim_set_var("loaded_netrw", 1)
vim.api.nvim_set_var("loaded_netrwPlugin", 1)

-- keymap
vim.g.mapleader = " "
vim.keymap.set("n", "<leader><Tab>", "<C-^>", { noremap = true })

-- let <ESC> quit terminal mode
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true })

-- continue selecting area after changing indentation in visual mode
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })

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
