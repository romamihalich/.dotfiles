local status_ok, nvim_lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

nvim_lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("romamihalich.lsp.handlers").on_attach,
        capabilities = require("romamihalich.lsp.handlers").capabilities,
    }

    server:setup(opts)
end)

