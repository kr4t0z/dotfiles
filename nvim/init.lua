-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

-- VSCode-specific configuration
if vim.g.vscode then
  vim.schedule(function()
    require('vscode_config')
  end)
end

-- Helper to safely load persisted.nvim and run a function
local function with_persisted(fn)
  local ok, persisted = pcall(require, "persisted")
  if ok then fn(persisted) end
end

-- Auto save session after every write
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    vim.schedule(function()
      with_persisted(function(persisted) vim.cmd "SessionSave" end)
    end)
  end,
})

-- Also save on quit (handles :wqa and :q)
vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
  callback = function()
    with_persisted(function(persisted) vim.cmd "SessionSave" end)
  end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.schedule(function()
      with_persisted(function(persisted) vim.cmd "SessionSelect" end)
    end)
  end,
})
