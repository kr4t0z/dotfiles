-- VSCode/Cursor specific configuration
-- This file only loads when Neovim is running inside VSCode/Cursor

if not vim.g.vscode then return end

local vscode = require "vscode"

-- <Leader>ff: Find files (using Periscope with preview)
vim.keymap.set(
  "n",
  "<Leader>ff",
  function() vscode.action "periscope.searchFiles" end,
  { noremap = true, silent = true, desc = "Find files with preview" }
)

-- <Leader>fw: Search in files (using Periscope)
vim.keymap.set(
  "n",
  "<Leader>fw",
  function() vscode.action "periscope.search" end,
  { noremap = true, silent = true, desc = "Search in files" }
)

-- <Leader>e: Toggle file explorer (sidebar)
vim.keymap.set(
  "n",
  "<Leader>e",
  function() vscode.action "workbench.action.toggleSidebarVisibility" end,
  { noremap = true, silent = true, desc = "Toggle explorer" }
)

-- Window navigation with predictable behavior
-- <C-h>: Always jump to file explorer
vim.keymap.set(
  "n",
  "<C-h>",
  function() vscode.action "workbench.explorer.fileView.focus" end,
  { noremap = true, silent = true, desc = "Focus file explorer" }
)

-- <C-l>: Jump to editor from file explorer, or focus first editor group
vim.keymap.set(
  "n",
  "<C-l>",
  function() vscode.action "workbench.action.focusFirstEditorGroup" end,
  { noremap = true, silent = true, desc = "Focus editor" }
)

-- <C-j>: Focus terminal (toggle)
vim.keymap.set(
  "n",
  "<C-j>",
  function() vscode.action "workbench.action.togglePanel" end,
  { noremap = true, silent = true, desc = "Focus terminal" }
)

-- <C-k>: Focus back to editor from terminal
vim.keymap.set(
  "n",
  "<C-k>",
  function() vscode.action "workbench.action.focusActiveEditorGroup" end,
  { noremap = true, silent = true, desc = "Focus editor" }
)

vim.opt.cmdheight = 0
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.shortmess:append "sWcC"
