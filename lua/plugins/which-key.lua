vim.pack.add({"https://github.com/folke/which-key.nvim.git"})
require("which-key").setup({
  preset = "helix",
  spec = {
    { "<leader>b", group = "Buffers" },
    { "<leader>g", group = "Git" },
    { "<leader>s", group = "Search" }
  }
})
