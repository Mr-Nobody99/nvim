vim.pack.add({ "https://github.com/folke/tokyonight.nvim.git" })

require("tokyonight").setup({
	style = "moon",
	lualine_bold = true,
	-- transparent = true,
	styles = {
		-- sidebars = "transparent",
		-- floats = "transparent",
		comments = { italic = false },
	},
})

vim.cmd.colorscheme("tokyonight")
