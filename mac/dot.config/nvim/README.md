# Neovim Configuration

## Plugins and Key Bindings

### bufferline.nvim

Buffer tabs display and management

| Key       | Mode | Description     |
| --------- | ---- | --------------- |
| `<Tab>`   | n    | Next Buffer     |
| `<S-Tab>` | n    | Previous Buffer |

---

### snacks.nvim

Multi-purpose plugin providing terminal, git, picker, and explorer functionality

#### Terminal

| Key          | Mode | Description         |
| ------------ | ---- | ------------------- |
| `<C-\>`      | n    | Toggle Terminal     |
| `<leader>th` | n    | Terminal Horizontal |
| `<leader>tv` | n    | Terminal Vertical   |
| `<leader>tf` | n    | Terminal Float      |

#### Git

| Key          | Mode | Description  |
| ------------ | ---- | ------------ |
| `<leader>lg` | n    | Open Lazygit |

#### Picker

| Key               | Mode | Description          |
| ----------------- | ---- | -------------------- |
| `<leader><space>` | n    | Smart Find Files     |
| `<leader>,`       | n    | Buffers              |
| `<leader>/`       | n    | Grep                 |
| `<leader>:`       | n    | Command History      |
| `<leader>n`       | n    | Notification History |

#### Explorer

| Key         | Mode | Description   |
| ----------- | ---- | ------------- |
| `<leader>e` | n    | File Explorer |

---

### which-key.nvim

Popup display for available keybindings

| Key         | Mode | Description               |
| ----------- | ---- | ------------------------- |
| `<leader>?` | n    | Show Buffer Local Keymaps |

---

### claudecode.nvim

Claude Code AI assistant integration

| Key          | Mode | Description                 |
| ------------ | ---- | --------------------------- |
| `<leader>a`  | n    | AI/Claude Code (prefix)     |
| `<leader>ac` | n    | Toggle Claude               |
| `<leader>af` | n    | Focus Claude                |
| `<leader>ar` | n    | Resume Claude               |
| `<leader>aC` | n    | Continue Claude             |
| `<leader>am` | n    | Select Claude Model         |
| `<leader>ab` | n    | Add Current Buffer          |
| `<leader>as` | v    | Send to Claude              |
| `<leader>as` | n    | Add File (in file explorer) |
| `<leader>aa` | n    | Accept Diff                 |
| `<leader>ad` | n    | Deny Diff                   |

---

### vim-tidal

TidalCycles integration for live coding

| Key                  | Mode | Description                                  |
| -------------------- | ---- | -------------------------------------------- |
| `<C-e>`              | n, v | Send current paragraph/line/selection        |
| `<localleader>ss`    | n    | Send current paragraph                       |
| `<localleader>s`     | n, v | Send current line or selected block          |
| `<localleader>s[num]`| n    | Play stream number [num]                     |
| `<localleader>[num]` | n    | Silence stream number [num]                  |
| `<localleader>h`     | n    | Hush (silence all streams)                   |
| `<C-h>`              | n    | Hush (silence all streams)                   |

**Note:** `<localleader>` must be configured in your config (e.g., `vim.g.maplocalleader = ","`). These keybindings only work in `.tidal` files.

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

### hlchunk.nvim

Indent chunk highlighting

### tiny-inline-diagnostic.nvim

Inline diagnostic messages display

### render-markdown.nvim / nvim-markdown

Markdown rendering and folding support
