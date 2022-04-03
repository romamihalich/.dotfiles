local status_ok, nvim_lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

nvim_lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("romamihalich.lsp.handlers").get_on_attach(server.name),
        capabilities = require("romamihalich.lsp.handlers").capabilities,
    }

    local settings_ok, settings = pcall(require, "romamihalich.lsp.server-settings." .. server.name)
    if settings_ok then
        opts = vim.tbl_deep_extend("force", settings, opts)
    end

    server:setup(opts)
end)

