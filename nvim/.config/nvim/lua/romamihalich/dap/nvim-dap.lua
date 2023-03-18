if vim.loop.os_uname().sysname ~= "Linux" then
    return
end

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

-- keymaps
local keymap = require("romamihalich.keymaps").keymap;
keymap("n", "<F5>",  dap.continue)
keymap("n", "<F9>",  dap.toggle_breakpoint)
keymap("n", "<F10>", dap.step_over)
keymap("n", "<F11>", dap.step_into)
keymap("n", "<F12>", dap.step_out)
-- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>

local dap_close = function()
    dap.close()
    dapui.close()
end

keymap("n", "<leader>dp", dap.pause, "Pause")
keymap("n", "<leader>dq", dap_close, "Close")
keymap("n", "<leader>dh", require'dap.ui.widgets'.hover, "Hover")
keymap("n", "<leader>de", require'dapui'.toggle, "Toggle sidebar")
