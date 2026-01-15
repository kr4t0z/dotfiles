return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
  },
  opts = {
    window = {
      width = 90,
      options = {
        number = false,
        relativenumber = false,
        signcolumn = "no",
      },
    },
    plugins = {
      gitsigns = { enabled = false },
      tmux = { enabled = true },
    },
  },
}
