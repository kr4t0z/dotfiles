-- Customize Mason plugins
--@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "AstroNvim/astrolsp",
    },
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "prismals",
        "eslint",
        -- add more arguments for adding more language servers
      },
      -- use AstroLSP setup for mason-lspconfig
      handlers = {
        function(server) require("astrolsp").lsp_setup(server) end,
      },
    },
    config = function(_, opts) require("mason-lspconfig").setup(opts) end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "stylua",
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "eslint_d",
        -- add more arguments for adding more null-ls sources
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "python",
        -- add more arguments for adding more debuggers
      },
    },
  },
}
