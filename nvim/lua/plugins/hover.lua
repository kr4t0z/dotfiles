return {
  "lewis6991/hover.nvim",
  event = "LspAttach",
  config = function()
    require("hover").setup({
      init = function()
        require("hover.providers.lsp")
        require("hover.providers.diagnostic")
        require("hover.providers.man")
        require("hover.providers.dictionary")
        -- Uncomment if you use DAP:
        -- require("hover.providers.dap")
      end,
      preview_opts = { border = "rounded" },
      preview_window = false,
      title = true,
      mouse_providers = { "LSP" },
      mouse_delay = 1000,
    })

    -- Keymaps
    vim.keymap.set("n", "K", require("hover").hover, { desc = "Hover" })
    vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "Hover select provider" })
    vim.keymap.set("n", "<C-p>", function()
      require("hover").hover_switch("previous")
    end, { desc = "Hover previous source" })
    vim.keymap.set("n", "<C-n>", function()
      require("hover").hover_switch("next")
    end, { desc = "Hover next source" })
  end,
}
