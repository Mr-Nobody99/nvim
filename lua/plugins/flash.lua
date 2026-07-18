vim.pack.add({ "https://github.com/folke/flash.nvim.git" })

local Flash = require("flash")
Flash.setup({
  modes = {
    search = { enabled = true }
  },
})

vim.keymap.set({"n", "x", "o"}, "s", function() Flash.jump() end, {desc = "Flash"})
vim.keymap.set({"n", "x", "o"}, "S", function() Flash.treesitter_search() end, {desc = "Flash"})
