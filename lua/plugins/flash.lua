vim.pack.add({ "https://github.com/folke/flash.nvim.git" })

local Flash = require("flash")

Flash.setup({
	modes = {
		char = { enabled = false },
		search = { enabled = true },
	},
	label = {
		after = false,
		before = true,
		rainbow = {
			enabled = true,
		},
	},
})

vim.keymap.set({ "n", "x", "o" }, "f", function()
	Flash.jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "x", "o" }, "F", function()
	Flash.treesitter_search()
end, { desc = "Flash Treesitter" })
