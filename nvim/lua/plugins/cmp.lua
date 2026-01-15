return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"

    -- 0. clear the built-ins that clash with our choices
    opts.mapping["<Tab>"] = nil
    opts.mapping["<S-Tab>"] = nil
    opts.mapping["<C-f>"] = nil -- cmp’s default “scroll docs” binding
    opts.mapping["<C-b>"] = nil -- (free it as well, usually the pair)

    -- 1. C-j / C-k to walk the menu
    opts.mapping["<C-j>"] = cmp.mapping.select_next_item {
      behavior = cmp.SelectBehavior.Insert,
    }
    opts.mapping["<C-k>"] = cmp.mapping.select_prev_item {
      behavior = cmp.SelectBehavior.Insert,
    }

    -- 2. C-f: accept Supermaven if there’s a ghost, otherwise behave nicely
    opts.mapping["<C-f>"] = cmp.mapping(function(fallback)
      local sm = require "supermaven-nvim.completion_preview"
      if sm and sm.has_suggestion() then
        sm.on_accept_suggestion()
      elseif cmp.visible() then
        cmp.confirm { select = true } -- accept highlighted menu entry
      else
        fallback() -- default <C-f> (move cursor right)
      end
    end, { "i", "s" })
  end,
}
