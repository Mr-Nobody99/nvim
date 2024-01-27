return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "js-debug-adapter",
      },
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    },
  },
}
