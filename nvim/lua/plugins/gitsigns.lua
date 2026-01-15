-- Override gitsigns config to fix deprecated signs_staged warning
return {
  "lewis6991/gitsigns.nvim",
  opts = function(_, opts)
    -- Remove deprecated signs_staged field
    opts.signs_staged = nil
    return opts
  end,
}
