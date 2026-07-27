vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim.git" })
require("render-markdown").setup({
	code = {
		language_icon = false,
		language_name = false,
	},
})
