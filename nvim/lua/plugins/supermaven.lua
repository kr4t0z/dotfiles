-- Only ask for suggestions when you use the <C-f> key, after that <C-f> can accept the suggestion too:
return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  opts = {
    keymaps = {
      accept_suggestion = "<C-f>", -- ← NEW hotkey
      clear_suggestion = "<C-]>", -- keep / change as you like
      next_suggestion = "<C-n>", -- keep / change as you like
      previous_suggestion = "<C-p>", -- keep / change as you like
      dismiss_suggestion = "<C-e>", -- keep / change as you like
    },
  },
  keys = {
    -- Toggle SuperMaven
    { "<leader>sm", "<cmd>SupermavenToggle<cr>", desc = "Toggle SuperMaven" },
  },
}
