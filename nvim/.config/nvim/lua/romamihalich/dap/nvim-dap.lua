local dap = require'dap'

vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})

local debuggers_path = os.getenv('HOME') .. '/.local/share/nvim/mason/bin/'

local debuggers = {
    'netcoredbg', 'python'
}
for _, debugger in ipairs(debuggers) do
    local dbg = require('romamihalich.dap.debuggers.'..debugger).get_conf(debuggers_path)
    dap.adapters[dbg.adapters.key] = dbg.adapters.value
    dap.configurations[dbg.configurations.key] = dbg.configurations.value
end

local dapui = require'dapui'

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
