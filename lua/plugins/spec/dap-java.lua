---@type NvPluginSpec
return {
  "mfussenegger/nvim-dap",
  ft = "java",
  dependencies = {
    { "rcarriga/nvim-dap-ui" },
  },
  config = function()
    local dap = require "dap"

    dap.configurations.java = {
      {
        type = "java",
        request = "attach",
        name = "Debug (Attach) - Remote",
        hostName = "127.0.0.1",
        port = 5005,
      },
      {
        type = "java",
        request = "launch",
        name = "Debug (Launch) - Current File",
        program = "${file}",
        projectName = "${workspaceFolder}",
        javaExec = "java",
        mainClass = "${relativeFile}",
        vmArgs = "",
        args = "",
        stopOnEntry = false,
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
      },
    }

    dap.adapters.java = function(callback, config)
      callback({
        type = "server",
        host = config.hostName or "127.0.0.1",
        port = config.port or 5005,
      })
    end

    vim.keymap.set("n", "<leader>jdr", function()
      dap.continue()
    end, { desc = "Run Java debug" })
  end,
}
