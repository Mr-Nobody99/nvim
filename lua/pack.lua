vim.pack.add({
    "https://github.com/folke/tokyonight.nvim.git",
    "https://github.com/neovim/nvim-lspconfig.git",
    "https://github.com/nvim-treesitter/nvim-treesitter.git",
    "https://github.com/nvim-tree/nvim-web-devicons.git",
})

local plugins_dir = vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "plugins")
for file_name, file_type in vim.fs.dir(plugins_dir, {follow = true}) do
  if (file_type == "file" or type == "link") and file_name:match("%.lua$") and file_name ~= "init.lua" then
    local mod = file_name:gsub("%.lua$", "")
    require("plugins.".. mod)
  end
end

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                    vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
                }
            }
        }
    }
})

vim.lsp.enable({
    "lua_ls",
    "zls",
})
