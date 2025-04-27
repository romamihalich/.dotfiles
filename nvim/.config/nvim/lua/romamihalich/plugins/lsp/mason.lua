require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { },
}
require("mason-lspconfig").setup_handlers {
    function (server_name)
        local opts = {
            capabilities = require("romamihalich.plugins.lsp.handlers").capabilities,
        }

        if server_name == "rust_analyzer" then
            -- already setup by plugin mrcjkb/rustaceanvim
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
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', "<cmd>lua require('omnisharp_extended').telescope_lsp_definitions()<CR>", { noremap=true, silent=true })
            end
        end

        require("lspconfig")[server_name].setup(opts)
    end,
}
