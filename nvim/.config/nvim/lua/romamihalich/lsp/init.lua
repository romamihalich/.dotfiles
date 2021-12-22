local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "romamihalich.lsp.nvim-lsp-installer"
require("romamihalich.lsp.handlers").setup()
