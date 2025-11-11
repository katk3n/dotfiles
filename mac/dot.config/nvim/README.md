# Neovim Configuration

## Plugins and Key Bindings

### bufferline.nvim
Buffer tabs display and management

| Key | Mode | Description |
|-----|------|-------------|
| `<Tab>` | n | Next Buffer |
| `<S-Tab>` | n | Previous Buffer |

---

### toggleterm.nvim
Terminal integration and management

| Key | Mode | Description |
|-----|------|-------------|
| `<C-\>` | n | Toggle Terminal |
| `<leader>th` | n | ToggleTerm Horizontal |
| `<leader>tv` | n | ToggleTerm Vertical |
| `<leader>tt` | n | ToggleTerm Tab |
| `<leader>tf` | n | ToggleTerm Float |

**Note:** Use `<number><C-\>` to open multiple terminals

---

### lazygit.nvim
LazyGit integration for Neovim

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>lg` | n | Open LazyGit |

---

### nvim-tree.lua
File explorer with floating window

| Key | Mode | Description |
|-----|------|-------------|
| `<C-p>` | n | Toggle NvimTree |

---

### which-key.nvim
Popup display for available keybindings

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>?` | n | Show Buffer Local Keymaps |

---

### telescope.nvim
Fuzzy finder and search interface

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ff` | n | Find Files |
| `<leader>fg` | n | Live Grep |
| `<leader>fb` | n | Buffers |
| `<leader>fh` | n | Help Tags |
| `<leader>fd` | n | Diagnostics |
| `<leader>ca` | n | Code Action |

---

### nvim-cmp
Auto-completion engine

| Key | Mode | Description |
|-----|------|-------------|
| `<C-b>` | i | Scroll Docs Up |
| `<C-f>` | i | Scroll Docs Down |
| `<C-Space>` | i | Complete |
| `<C-e>` | i | Abort Completion |
| `<CR>` | i | Confirm Selection |

**Completion sources:** LSP, Lua, LuaSnip, Buffer, Path, Cmdline, render-markdown

---

### claudecode.nvim
Claude Code AI assistant integration

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>a` | n | AI/Claude Code (prefix) |
| `<leader>ac` | n | Toggle Claude |
| `<leader>af` | n | Focus Claude |
| `<leader>ar` | n | Resume Claude |
| `<leader>aC` | n | Continue Claude |
| `<leader>am` | n | Select Claude Model |
| `<leader>ab` | n | Add Current Buffer |
| `<leader>as` | v | Send to Claude |
| `<leader>as` | n | Add File (in file explorer) |
| `<leader>aa` | n | Accept Diff |
| `<leader>ad` | n | Deny Diff |

---

## Plugins Without Custom Keybindings

### tokyonight.nvim
Color scheme with transparency support

### lualine.nvim
Status line display

### nvim-treesitter
Syntax highlighting and code parsing with text objects support

### gitsigns.nvim
Git diff signs and highlights in the gutter

### nvim-autopairs
Automatic bracket and quote pairing (works automatically in insert mode)

### lsp.lua (LSP Configuration)
Language Server Protocol configuration with Mason, none-ls, and lspsaga

**Supported LSP servers:**
- Python: pyright, ruff
- Bash: bashls
- Lua: lua_ls
- YAML: yamlls
- JSON: jsonls
- TOML: taplo
- Rust: rust_analyzer
- TypeScript/JavaScript: ts_ls
- HTML: html
- CSS: cssls
- Go: gopls
- WGSL: wgsl_analyzer

**Formatters:** djlint, stylua, shfmt, prettier

**Diagnostics:** yamllint, selene

### vim-tidal
TidalCycles integration for live coding

### hlchunk.nvim
Indent chunk highlighting

### tiny-inline-diagnostic.nvim
Inline diagnostic messages display

### render-markdown.nvim / nvim-markdown
Markdown rendering and folding support
