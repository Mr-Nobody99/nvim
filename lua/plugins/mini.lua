vim.pack.add({ "https://github.com/nvim-mini/mini.nvim.git" })

require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.icons").setup()
require("mini.move").setup()

-- require("mini.notify").setup({
-- 	content = {
-- 		format = function(note)
-- 			return note.msg
-- 		end,
-- 	},
-- 	window = {
-- 		max_width_share = 0.5,
-- 	},
-- })

require("mini.files").setup({
	window = {
		preview = true,
	},
})

vim.keymap.set("n", "<leader>fm", function()
	require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
end, { desc = "Open Mini.files on current file" })
