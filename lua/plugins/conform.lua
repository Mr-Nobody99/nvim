vim.pack.add({ "https://github.com/stevearc/conform.nvim.git" })

require("conform")({
	formatters_by_ft = {
		css = { "prettier" },
		html = { "prettier" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		markdown = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = function(buf)
		if not vim.g.disable_autoformat and not vim.b[buf].disable_autoformat then
			return { timeout_ms = 500, lsp_format = "fallback" }
		end
	end,
})

vim.api.nvim_create_user_command("AutoFormatDisable", function(args)
	if args.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable format on save",
	bang = true,
})

vim.api.nvim_create_user_command("AutoFormatEnable", function(args)
	if args.bang then
		vim.b.disable_autoformat = false
	else
		vim.g.disable_autoformat = false
	end
end, {
	desc = "Disable format on save",
	bang = true,
})

vim.keymap.set("n", "<leader>uf", function()
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	local status = tostring(not vim.g.disable_autoformat)
	vim.notify("Format On Save: " .. status)
end, { desc = "Toggle format on save" })

vim.keymap.set({ "n", "x" }, "<leadulter>cf", function()
	require("conform").format()
end, { desc = "Format" })
