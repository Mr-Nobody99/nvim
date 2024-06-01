return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon",
        transparent = false,
        day_brightness = 0.4,
        terminal_colors = true,
      })
    end,
  },
}
