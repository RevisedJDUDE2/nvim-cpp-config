return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")
    dapui.setup({});
    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = 'executable',
      port = "${port}",
      command = vim.fn.stdpath("data") .. "\\mason\\packages\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe",
      options = { detached = false }
    }
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
      },
    }
    dap.set_log_level("DEBUG")
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end)
    vim.keymap.set("n", "<F5>", function() dap.continue() end)
    vim.keymap.set("n", "<F10>", function() dap.step_over() end)
    vim.keymap.set("n", "<F3>", function() dap.step_into() end)
    vim.keymap.set("n", "<F2>", function() dap.step_out() end)
    vim.keymap.set("n", "<leader>dc", function ()
      dapui.close();
    end)
    vim.keymap.set("n", "<leader>dt", function ()
      dapui.toggle();
    end)
  end,
}
