require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { },
}
require("mason-lspconfig").setup_handlers {
    function (server_name)
        local opts = {
            on_attach = require("romamihalich.lsp.handlers").get_on_attach(server_name),
            capabilities = require("romamihalich.lsp.handlers").capabilities,
        }

        local settings_ok, settings = pcall(require, "romamihalich.lsp.server-settings." .. server_name)
        if settings_ok then
            opts = vim.tbl_deep_extend("force", settings, opts)
        end

        if server_name == "rust_analyzer" and require('romamihalich.lsp.rust-tools').setup(opts) then
            return
        end

        require("lspconfig")[server_name].setup(opts)
    end,
}
