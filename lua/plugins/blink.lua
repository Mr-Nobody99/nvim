vim.pack.add({{
  src = "https://github.com/saghen/blink.cmp.git",
  version = "v1.10.2"
}})
require("blink.cmp").setup({
    completion = {
        documentation = {
            auto_show = true,
        },
    },
    keymap = {
        preset = "enter",
        ["<Tab>"] = {"select_next", "fallback"},
        ["<S-Tab>"] = {"select_prev", "fallback"},
    }
})
vim.lsp.config["*"] = {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
}
