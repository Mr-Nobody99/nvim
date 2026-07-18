vim.pack.add({ "https://github.com/folke/snacks.nvim.git" })

local Snacks = require("snacks")

Snacks.setup({
  explorer = {enabled = true},
  picker = {enabled = true},
  indent = {enabled = true},
  input = {enabled = true},
})

vim.keymap.set({"n", "t"}, "<C-\\>", function() Snacks.terminal("zsh") end, { desc = "Floating Terminal" })
vim.keymap.set({"n", "t"}, "<C-/>", function() Snacks.terminal() end, { desc = "Bottom Terminal" })
vim.keymap.set("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })

vim.keymap.set("n", "<leader><space>", function() Snacks.picker.files() end, {desc = "File Picker"})
vim.keymap.set("n", "<leader>e", function() Snacks.explorer() end, {desc = "Snacks Explorer"})

