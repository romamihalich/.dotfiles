local M = {}

function M.setup(opts)
    local ok, rt = pcall(require, "rust-tools")
    if not ok then
        print("rust-tools are not loaded")
        return false
    end

    local extension_path = require("mason-registry")
                          .get_package("codelldb")
                          :get_install_path()
                          .. '/extension/'
    local codelldb_path = extension_path .. 'adapter/codelldb'
    local liblldb_path  = extension_path .. 'lldb/lib/liblldb.so'

    rt.setup({
        server = {
            on_attach = function (client, bufnr)
                opts.on_attach(client, bufnr)
                vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
            end,
        },
        dap = {
            adapter = require('rust-tools.dap').get_codelldb_adapter(
                codelldb_path, liblldb_path)
        },
    })

    return true
end

return M
