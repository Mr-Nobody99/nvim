vim.pack.add({ {
	src = "https://github.com/saghen/blink.cmp.git",
	version = "v1.10.2",
} })

-- vim.pack.add({
-- 	"https://github.com/saghen/blink.lib.git",
-- 	"https://github.com/saghen/blink.cmp.git",
-- })

local Blink = require("blink.cmp")
-- Blink.build():pwait()
Blink.setup({
	completion = {
		documentation = {
			auto_show = true,
		},
	},
	keymap = {
		preset = "enter",
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
	},
})

vim.lsp.config("*", {
	capabilities = vim.tbl_deep_extend(
		"force",
		vim.lsp.protocol.make_client_capabilities(),
		Blink.get_lsp_capabilities()
	),
})
