return {
  "NeogitOrg/neogit",
  commit = "bc0c609e3568a171e0549b449aa1b2b4b5b20e8c",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional - for better menu selection
  },
  config = function()
    local neogit = require "neogit"

    neogit.setup {
      -- Explicitly set the git command path
      git_cmd = vim.fn.executable "git" == 1 and "git" or nil,

      kind = "tab",
      integrations = {
        diffview = true,
      },

      -- If you're in a project with git submodules, this might help
      disable_signs = false,
      disable_hint = false,
      disable_context_highlighting = false,
      disable_insert_on_commit = "auto",
    }

    vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { desc = "Open Neogit" })
  end,
}
