-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  {
    require("nvim-ts-autotag").setup(),
  },
  opts = {
    ensure_installed = {
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "html",
      "css",
      "prisma",
      "markdown",
      "markdown_inline",
      "svelte",
      "graphql",
      "bash",
      "lua",
      "vim",
      "haskell",
      "rust",
      "dockerfile",
      "gitignore",
      "query",
      "vimdoc",
      "c", -- add more arguments for adding more treesitter parsers
    },
    autotag = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
    },
  },
}
