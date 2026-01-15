return {
  "gorbit99/codewindow.nvim",
  event = "VeryLazy",
  config = function()
    local codewindow = require("codewindow")
    codewindow.setup({
      auto_enable = false, -- set to true if you want it always on
      minimap_width = 10,
      width_multiplier = 4,
      use_treesitter = true,
      exclude_filetypes = { "neo-tree", "alpha", "Trouble", "lazy", "mason", "toggleterm" },
    })
    -- Keybindings
    vim.keymap.set("n", "<leader>um", codewindow.toggle_minimap, { desc = "Toggle minimap" })
  end,
}
