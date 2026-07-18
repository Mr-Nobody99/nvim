vim.treesitter.language.register("bash", {"sh"})
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"sh"},
    callback = function()
        vim.treesitter.start()
    end
})
