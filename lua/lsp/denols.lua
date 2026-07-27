vim.lsp.config("denols", {
	root_markers = { "deno.json", "deno.jsonc" },
})

vim.lsp.enable({ "denols" })
