require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { },
}
require("mason-lspconfig").setup_handlers {
    function (server_name)
        local default_on_attach = require("romamihalich.plugins.lsp.handlers").on_attach

        local opts = {
            on_attach = default_on_attach,
            capabilities = require("romamihalich.plugins.lsp.handlers").capabilities,
        }

        if server_name == "rust_analyzer" and require('romamihalich.plugins.lsp.rust-tools').setup(opts) then
            return
        end

        if server_name == "lua_ls" then
            opts = vim.tbl_deep_extend("force", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            }, opts)
        end

        if server_name == "omnisharp" then
            opts.on_attach = function(client, bufnr)
                default_on_attach(client, bufnr)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', "<cmd>lua require('omnisharp_extended').telescope_lsp_definitions()<CR>", { noremap=true, silent=true })
            end
        end

        if server_name == "tsserver"   then
            opts .on_attach = function(client, bufnr)
                default_on_attach(client, bufnr)
                client.server_capabilities.document_formatting = false
            end
        end

        require("lspconfig")[server_name].setup(opts)
    end,
}
