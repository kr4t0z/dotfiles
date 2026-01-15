return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			transparent_background = true, -- matches your Ghostty opacity
		})

		-- setup must be called before loading
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
