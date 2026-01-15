return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require "elixir"
    local elixirls = require "elixir.elixirls"

    -- Create an autogroup for Elixir formatting
    local elixir_format_group = vim.api.nvim_create_augroup("ElixirFormat", { clear = true })

    elixir.setup {
      nextls = {
        enable = true, -- Use NextLS instead of Lexical (builds for your OTP version)
        spitfire = true, -- Enable experimental Spitfire parser for better performance
      },
      elixirls = {
        enable = false, -- Disable elixir-tools' elixirls since we're using mason's
        settings = elixirls.settings {
          dialyzerEnabled = false,
          enableTestLenses = false,
        },
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })

          -- Add async auto-formatting with mix format on save for Elixir files
          vim.api.nvim_create_autocmd("BufWritePost", {
            group = elixir_format_group,
            buffer = bufnr,
            callback = function()
              local file = vim.fn.expand "%"
              if file:match "%.ex$" or file:match "%.exs$" then
                -- Run mix format asynchronously
                vim.defer_fn(function()
                  local job_id = vim.fn.jobstart("mix format " .. vim.fn.shellescape(file), {
                    on_exit = function(_, exit_code)
                      if exit_code == 0 then
                        vim.schedule(function()
                          if not vim.bo.modified then vim.cmd "checktime" end
                        end)
                      end
                    end,
                  })
                end, 10) -- slight delay for better responsiveness
              end
            end,
          })
        end,
      },
      projectionist = {
        enable = true,
      },
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
