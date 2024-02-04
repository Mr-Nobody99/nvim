local dap = require("dap")

dap.adapters["pwa-node"] = {
  type = "server",
  port = "${port}",
  host = "localhost",
  executable = {
    command = "js-debug-adapter",
    args = { "${port}" },
  },
}

dap.configurations["typescript"] = {
  {
    name = "Launch file tsx",
    request = "launch",
    type = "pwa-node",

    program = "${file}",
    runtimeExecutable = "tsx",
    cwd = "${workspaceFolder}",
    console = "integratedTerminal",
    skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
  },
  {
    name = "Launch file deno",
    request = "launch",
    type = "pwa-node",

    program = "${file}",
    attachSimplePort = 9229,
    cwd = "${workspaceFolder}",
    runtimeExecutable = "deno",
    skipFiles = { "<node_internals>/**" },

    runtimeArgs = {
      "run",
      "--allow-all",
      "--inspect-wait",
    },
  },
  {
    name = "Launch file",
    request = "launch",
    type = "pwa-node",

    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}
