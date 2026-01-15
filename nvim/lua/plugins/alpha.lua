return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"

    -- Load the header directly from your Lua file
    local header_path = vim.fn.stdpath "config" .. "/lua/plugins/header_img/img.lua"
    local ok, header_module = pcall(dofile, header_path)

    if ok and header_module and header_module.header then
      -- Set header directly in dashboard configuration
      dashboard.section.header = header_module.header
    else
      -- Fallback to a simple header if your file doesn't load properly
      dashboard.section.header = {
        type = "text",
        val = {
          "Unable to load custom header",
          "Check your paste.lua file format",
        },
        opts = {
          position = "center",
          hl = "Type",
        },
      }
    end

    -- Configure the buttons
    dashboard.section.buttons.val = {
      dashboard.button("c", "🛠️ Settings", ":e $HOME/.config/nvim/init.lua<CR>"),
      dashboard.button("r", "⌛ Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "🖮  Practice typing with Typr ", ":Typr<CR>"),
      dashboard.button("u", "🔌 Update plugins", "<cmd>Lazy update<CR>"),
    }

    -- Make sure footer exists to avoid nil errors
    dashboard.section.footer = {
      type = "text",
      val = "",
      opts = {
        position = "center",
        hl = "DashboardFooter",
      },
    }

    -- Use AstroNvim's layout style
    dashboard.config.layout = {
      { type = "padding", val = 0 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 0 },
      dashboard.section.footer,
    }

    -- Add stats to footer after lazy loads
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      desc = "Add Alpha dashboard footer",
      once = true,
      callback = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        dashboard.section.footer.val = { " ", " ", " ", "Loaded " .. stats.count .. " plugins  in " .. ms .. "ms" }
        pcall(vim.cmd.AlphaRedraw)
        vim.cmd "normal! j"
        vim.cmd "normal! j"
        vim.cmd "normal! j"
        vim.cmd "normal! j"

        vim.cmd "normal! j"
        vim.cmd "normal! j"
        vim.cmd "normal! j"
        vim.cmd "normal! j"
        vim.cmd "normal! j"
      end,
    })

    -- Important: ensure proper configuration is passed to setup
    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.config) -- Note: using dashboard.config, not dashboard.opts
  end,
}
