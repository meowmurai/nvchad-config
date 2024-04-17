local dap_go = require "dap-go"
local dapui = require "dapui"
local dap = require "dap"

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

dapui.setup()
dap_go.setup()

require("dap.ext.vscode").load_launchjs()
