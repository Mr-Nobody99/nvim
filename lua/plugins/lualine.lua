vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim.git", })

local function recording()
  local rec = vim.fn.reg_recording()
  if rec ~= "" then return "◉" .. rec else return "" end
end

require("lualine").setup({
  sections = {
    lualine_a = {
      { recording },
      { "mode" },
    }
  }
})
