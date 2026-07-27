-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yank",
    callback = function()
        vim.hl.on_yank()
    end
})

-- auto resize splits
vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    local tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. tab)
  end
})

-- close with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "checkhealth",
    "help",
    "lspinfo",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, {force = true})
      end, {
      desc = "Quit buffer",
      buf = event.buf,
      silent = true,
    })
    end)
  end
})
