vim.pack.add({ "https://github.com/b0o/SchemaStore.nvim.git" })
vim.lsp.config("jsonls", {
	settings = {
		json = {
			format = { enable = true },
			validate = { enable = true },
			schemas = require("schemastore").json.schemas(),
		},
	},
})
