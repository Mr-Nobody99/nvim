vim.pack.add({ "https://github.com/neovim/nvim-lspconfig.git" })

vim.diagnostic.config({
	virtual_text = true,
})

require("lsp")
