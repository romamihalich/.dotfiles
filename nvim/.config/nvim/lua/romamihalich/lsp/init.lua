local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.api.nvim_err_writeln("Can't load 'lspconfig'")
    return
end

require "romamihalich.lsp.nvim-lsp-installer"
require("romamihalich.lsp.handlers").setup()
