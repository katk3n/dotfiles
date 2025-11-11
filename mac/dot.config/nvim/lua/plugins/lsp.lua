local lsp_servers = {
  "pyright",
  "ruff",
  "bashls",
  "lua_ls",
  "yamlls",
  "jsonls",
  "taplo",
  "rust_analyzer",
  "ts_ls",
  "html",
  "cssls",
  "gopls",
  "wgsl_analyzer",
}

local formatters = {
  "djlint",
  "stylua",
  "shfmt",
  "prettier",
}

local diagnostics = {
  "yamllint",
  "selene",
}

return {
  -- lsp icons like vscode
  {
    "onsails/lspkind.nvim",
    event = "InsertEnter",
  },

  -- mason / mason-lspconfig
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason").setup()

      -- Get capabilities from nvim-cmp for LSP completion
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      if has_cmp then
        capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
      end

      -- Configure LSP servers using vim.lsp.config (Neovim 0.11+)
      for _, server_name in ipairs(lsp_servers) do
        vim.lsp.config[server_name] = {
          root_markers = { ".git" },
          capabilities = capabilities,
        }
      end

      -- Setup mason-lspconfig and enable LSP servers
      require("mason-lspconfig").setup({
        ensure_installed = lsp_servers,
        handlers = {
          -- Default handler: enable all installed servers
          function(server_name)
            vim.lsp.enable(server_name)
          end,
        },
      })

      -- Enable built-in LSP completion (Neovim 0.11+)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
          end
        end,
      })
    end,
    cmd = "Mason",
  },

  -- mason-null-ls
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      -- "jose-elias-alvarez/null-ls.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        automatic_setup = true,
        -- formatters table and diagnostics table Install
        ensure_installed = vim.tbl_flatten({ formatters, diagnostics }),
        handlers = {},
      })
    end,
    cmd = "Mason",
  },

  -- none-ls
  {
    -- "jose-elias-alvarez/null-ls.nvim",
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")

      -- formatters table
      local formatting_sources = {}
      for _, tool in ipairs(formatters) do
        table.insert(formatting_sources, null_ls.builtins.formatting[tool])
      end

      -- diagnostics table
      local diagnostics_sources = {}
      for _, tool in ipairs(diagnostics) do
        table.insert(diagnostics_sources, null_ls.builtins.diagnostics[tool])
      end

      -- none-ls setup
      null_ls.setup({
        diagnostics_format = "[#{m}] #{s} (#{c})",
        sources = vim.tbl_flatten({ formatting_sources, diagnostics_sources }),
      })
    end,
    event = { "BufReadPre", "BufNewFile" },
  },

  -- lspsaga
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          separator = "  ",
        },
        lightbulb = {
          enable = false,
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = { "BufRead", "BufNewFile" },
  },

  -- mason-nvim-dap
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      ensure_installed = {
        "python",
      },
      handlers = {},
    },
  },
}
